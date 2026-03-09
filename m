Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1CE8FCC074
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 09:12:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NjcBONkMoVYNk/I2oLylena5NUCF0ifyGHKNjVOiQpw=; b=XMw+hNopfo+hAcH7AUblrl6k2n
	USSnH73F6SiOgI+zVnfuDQ1sf5U0jLX7Lqf/GgVFcgJk1dsIZ6ElOQR7qy5Vyy3EaCDIBww85e5PL
	CDsR5XtFnTzW1JnCkBwdIcV48e+90OSZXjrTn1HbAmpdCCQKL90Tm7R/c5gZnrudIBkmdz1B1CQu5
	nibRghMJqVYxncavBBX7QjlPoQLdWlGkduVTKJSDl9whynCUKaqvnAxhrMNtc3Et9Et0LN1zqMP0S
	K3TXtjQ3aeTD6zuIzNizWqpHTxfbRoWUeroPmGqAW+7P54KexhLrO0eMlv3DjIBmxa3GhJ8XDvxuD
	8AtxpC6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzWfD-00000006wV7-48BO;
	Mon, 09 Mar 2026 09:12:36 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzWfA-00000006wTu-3Wk0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Mar 2026 09:12:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0EC064342E;
	Mon,  9 Mar 2026 09:12:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8036CC4CEF7;
	Mon,  9 Mar 2026 09:12:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773047551;
	bh=HK8Ldfq8Pz6rymjol0HQgiezb+xF7m+IWcWEVqkrwPo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=osAjhPxEJia2EOi8ZPOlx4CD9iddFzLdOTdYOFApXBcBA4zWxXG46mX46XiHqeBPW
	 HMr1NN7+10CMdg02MExioESsxczW9QRZNNHWHnx28AsqCSCT83zxV1RcVVYoMhPhhs
	 QJKq99CNjiB4RIdf/Icg/+6r2g6pLOp5Gaz04GC/Fl9bXjP/CtjsEts8nZjKJEdBXX
	 XX5f6pNZ+8fNhjCApJ7fz+5mLdYryEozXv2XPoL3f1pJVR92CLhDYg6+3G0HF0c5Q/
	 Zkwk1lJQggJ7EFKejdpplPIYwm1Q+8DEeOM2x+yvons8TzZNo1ylUPt62mXvuZa87I
	 5j34UViKs423Q==
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Cristian Marussi <cristian.marussi@arm.com>,
	"Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH] firmware: arm_scmi: base: Simplify protocol list size calculation
Date: Mon,  9 Mar 2026 09:12:26 +0000
Message-ID: <177304751104.1268411.8740611706535429825.b4-ty@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260228-scmi-check-v1-1-4935b58bb2db@nxp.com>
References: <20260228-scmi-check-v1-1-4935b58bb2db@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_021232_897380_BFCFD4F8 
X-CRM114-Status: UNSURE (   6.82  )
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

On Sat, 28 Feb 2026 11:37:33 +0800, Peng Fan (OSS) wrote:
> Replace the open-coded round-up calculation with the kernel's round_up()
> helper function for better readability.
> 
> The original expression:
>   (1 + (loop_num_ret - 1) / sizeof(u32)) * sizeof(u32)
> 
> is equivalent to rounding up loop_num_ret to the nearest multiple of
> sizeof(u32), which is exactly what round_up() does.
> 
> [...]

Applied to sudeep.holla/linux (for-next/scmi/updates), thanks!

[1/1] firmware: arm_scmi: base: Simplify protocol list size calculation
      https://git.kernel.org/sudeep.holla/c/09bb95d63ade
--
Regards,
Sudeep


