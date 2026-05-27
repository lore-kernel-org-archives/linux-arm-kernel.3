Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CBD6CD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 May 2026 09:18:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6Gqf4LVVsH4MVlU3r0iwi+Zk+hze6DeDRnMheAGpRTM=; b=auAgl9I+9t5OlKCVSbrRUnG+1d
	Wn8rFVK3Lp7j1nCxc/iFpOqKZGp5eBlLDRbHou/McNXUAC0bI4Eq2bwvfJnWycYBmE7o4aO8vIQSr
	Wm3LcGSE7wka2ljqRw26T2Ww7+PdOzc4L7i0Tvzly4Ev2rQAqtuZb516eeo8N6n8u+5TL/Ncaeg+C
	kjthgueFHZhXugddJNBpw9KqPjggK1nN7EMLR9nuLYg/YZzqxjD9updYeWO6CcNWz4cOmntTBEH1Q
	LwHgTdnXr+74t/7uLR54lsAJ5qc9nbsBuXREqKsw+kMKsPpM5aB/UVdPVXuPyAc6SuDX/+gujhgok
	Z3jQrk2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSAPN-00000003cb2-2Wzc;
	Wed, 27 May 2026 09:18:37 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSAPL-00000003caW-0KSF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 May 2026 09:18:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4914A42E37;
	Wed, 27 May 2026 09:18:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05DF21F000E9;
	Wed, 27 May 2026 09:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779873514;
	bh=6Gqf4LVVsH4MVlU3r0iwi+Zk+hze6DeDRnMheAGpRTM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=hsyNFnaDjsOoibfotuhtAinNYCgowpiwXrngbRJXOBE/9MUkXMrHhDSBLMN9U9gUD
	 OF3mjpy+EhEzrO9EVwxQrgm8uxr11TBDG+q4CmXzdrB40KpL1PsPedkZ1Uvx4xpbwY
	 K/8+0jdq+xuxSReJ6yE6zhu7/buIWE+tiIqAoGeOB+LMA8QGZQnIhfYLWnWlnSi3pf
	 YsiCRW1li7iUlpQRENoeEyOzBdMWZWKysZcbzDp/ECZrUlnCut4PS1m6KL5olAopmu
	 oNlq5xOlQ733B9necCcniSLKQrFskJsPDyr9pmUq1VU2vLtsePBLK7Si5DVqoHIuhA
	 +vK7pzsuN8BOg==
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Cristian Marussi <cristian.marussi@arm.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] firmware: arm_scmi: Fix OOB in scmi_power_name_get()
Date: Wed, 27 May 2026 10:18:29 +0100
Message-ID: <177987346786.277758.12058496226844072630.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <75caae28bdffb55199a0bc6cac5df112a966c608.1778838987.git.geert+renesas@glider.be>
References: <75caae28bdffb55199a0bc6cac5df112a966c608.1778838987.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_021835_181081_E90FD590 
X-CRM114-Status: UNSURE (   8.75  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Fri, 15 May 2026 11:59:15 +0200, Geert Uytterhoeven wrote:
> scmi_power_name_get() does not validate the domain number passed by the
> external caller, which may lead to an out-of-bounds access.
> 
> Fix this by returning "unknown" for invalid domains, like
> scmi_reset_name_get() does.
> 
> 
> [...]

Applied to sudeep.holla/linux (for-next/scmi/updates), thanks!

[1/1] firmware: arm_scmi: Fix OOB in scmi_power_name_get()
      https://git.kernel.org/sudeep.holla/c/f9ef3f66f4b1

--
Regards,
Sudeep


