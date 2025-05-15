Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EA89C3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 May 2025 00:24:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nc/AJGfHBul8N3gi1SChFxGzUE4KiP+XdaAIbRHymQ4=; b=RWm2N3UJTBnla8EhSSrWL4kHKz
	d1q1h0kHnsPn5ijzVCxW2c68Q6cTIqOqdfO7CeJpMS8CQPZbiEtacl6zcLWRnj7AsAapWESQxHr5Z
	f/JpR7UfBJawEJUFzCa593u8QsZ3IApp5B87whm7oGZbFsY3Md1oaNgL+ibxhuZVvzJPfH+FWiYyl
	Z1AMLkq/A7H+R7hKX57slwTX6/a+V1hiPOnA7/NxG9iDX8Rpj0B2NMHgN1XQcJSI+XiFjeuMD0qCr
	xIhNMDL6HvWptQIlEA0jelhDALC+bwu9wHM8vCRXLx8zk91NKprwVW96Eo6o23SqeUaf+O+orku2B
	7IBK+7Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFMOT-0000000Ghmb-2SzW;
	Thu, 15 May 2025 00:24:13 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFMMG-0000000Ghgo-0Mva
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 May 2025 00:22:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 3441AA4E37A;
	Thu, 15 May 2025 00:21:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7D6AC4CEE3;
	Thu, 15 May 2025 00:21:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747268514;
	bh=iZxb2jBSDnEKEW1l8qaYvCVJkwZAk7SAXLmlCJt7lxE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=giLgSzaBsrTSQmdRgRpUok5qVyhLCBeiG1y7Q+F9QOxdTyOHZSGu3wBBs5jdwmRQd
	 Y/dEjgXDvwC9CKdCgvIwpnWGjd2lySS6TaDlfUZoknEMD5nBADd8fMm0OWh/9GZMr3
	 iGncaotXhTW+6uDLr/woGh7OgWk4uDrKRUhY7gkhOW+51suO/j2DAR9hjm1wOXubmb
	 DcC4Mb7wl/hrkhz9FTBcg0+CEFl022ZyX3G92G1cCXSJP6LiIGb80NkfAkeFbwUK4a
	 yjHIb1AAzbqy+v/TYQ308zyorknRpWQqpR5F6WVe5/Ap3cOvld6RUk3efsGxU5fBdD
	 BNpRuEqQCkY8Q==
From: William Breathitt Gray <wbg@kernel.org>
To: lee@kernel.org,
	ukleinek@kernel.org,
	alexandre.torgue@foss.st.com,
	Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Cc: William Breathitt Gray <wbg@kernel.org>,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	jic23@kernel.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-pwm@vger.kernel.org,
	olivier.moysan@foss.st.com
Subject: Re: (subset) [PATCH v3 3/8] counter: stm32-timer-cnt: add support for stm32mp25
Date: Thu, 15 May 2025 09:21:44 +0900
Message-ID: <174726846872.375413.17945727550032496363.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250110091922.980627-4-fabrice.gasnier@foss.st.com>
References: <20250110091922.980627-1-fabrice.gasnier@foss.st.com> <20250110091922.980627-4-fabrice.gasnier@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=openpgp-sha256; l=630; i=wbg@kernel.org; h=from:subject:message-id; bh=OdGDVpoycRi9OLgJVrxFO0kSREUlcdbL9tUWTQlQjY0=; b=owGbwMvMwCW21SPs1D4hZW3G02pJDBmqxk0rK0SetGYe2/NbVNbk7vGd194rcnVfNZvmKK+fq uxzofRMRykLgxgXg6yYIkuv+dm7Dy6pavx4MX8bzBxWJpAhDFycAjCRrT2MDDMPdm3oZe7d43yL P/HuJlNRHv4LndeCOZdZimyW5v6+4gAjw4K73xwSPxzacXX6f0v3gChdga36XCHf71mdSLv1dbV /LDcA
X-Developer-Key: i=wbg@kernel.org; a=openpgp; fpr=8D37CDDDE0D22528F8E89FB6B54856CABE12232B
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_172156_199458_935AC937 
X-CRM114-Status: UNSURE (   9.52  )
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


On Fri, 10 Jan 2025 10:19:17 +0100, Fabrice Gasnier wrote:
> Add support for STM32MP25 SoC. There are new counter modes that may be
> implemented in later. Still, use newly introduced compatible to handle
> this new HW variant and avoid being blocked with existing compatible
> in SoC dtsi file. Modes supported currently still remains compatible.
> New timer 20 has encoder capability, add it to the list.
> 
> 
> [...]

Applied, thanks!

[3/8] counter: stm32-timer-cnt: add support for stm32mp25
      commit: ace2cd11a27231efcb8a116a597edab2eef34957

Best regards,
-- 
William Breathitt Gray <wbg@kernel.org>

