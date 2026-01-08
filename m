Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8716D1D47D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 15:45:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uCeCeimucjCaP535NGwMJwYj62zTUinDV1/mQx/kINs=; b=Yu7RtYA4SzY58sSA1L39A3V8NG
	7vM8fIhfAJAW41JUmvHhAdXPloZ3r9xHpbG/Z3gLDrgP1Q1Vc4v//ZwxN6nTG93qcRXbe9XSk2wZk
	hmi4NRj0R/bQzRglsNhQEAtfsse/5T1MB5/EnTiveDng00Aedzn+VUMJOXnTOZrnTg+533jjdkIaJ
	1id1t6v9i7FndbtbOSxkeMnGsPGLVeVTAI+0+0jHLw6YFnWH95SQ9JaKDOidwL/ngVOFdXQRBEbVD
	tyPcP4XpQh43k5gFdQu6TDUzLoU2VULfW58vfk0UKngcxHap5NFNb3+OBbA1YWB2fPJwlVccqc8qN
	qHvdOpDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdsCd-0000000HZDl-2zhJ;
	Thu, 08 Jan 2026 15:45:35 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdsCZ-0000000HZCX-1K4B;
	Thu, 08 Jan 2026 15:45:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=uCeCeimucjCaP535NGwMJwYj62zTUinDV1/mQx/kINs=; b=J9N1uqykG2Qxoxw/g34oGTX3La
	vHfTxvF1/cGO6CWMSuz8hpUzuWIZjz530wRgbMpzcMjcRBJCC+iwTxZhtDUoFOPgksjigvu443CGc
	iewuMhbofmOWHOfKL4bzjK5X3tIF6b3chMafqBimDMLr69mDBweMMYbxreQOEtb76y+mEwi9+Dwub
	Qco76G3yKMStrPYBKKNvuI2EQNNdjxPmlUWWslGGMfvvlgOZy2cxaU4eNL84DForHG0ZjGi6Sh0C2
	EAgwIgaRiit4M6eXzfADGK1Ob7JOW9bgRoTSo3VzOeYpMwm9AJDaQ1gxBDkwvVPweVq9DCtC0Su3i
	lI2usngg==;
Received: from i53875a63.versanet.de ([83.135.90.99] helo=phil..)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vdsCO-001W86-Se; Thu, 08 Jan 2026 16:45:21 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Andy Yan <andyshrk@163.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	hjc@rock-chips.com,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH 1/2] drm/rockchip: vop2: Add delay between poll registers
Date: Thu,  8 Jan 2026 16:45:19 +0100
Message-ID: <176788711595.3235249.5659814329200289480.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250718064120.8811-1-andyshrk@163.com>
References: <20250718064120.8811-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_074533_251931_ED27CD40 
X-CRM114-Status: GOOD (  11.31  )
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


On Fri, 18 Jul 2025 14:41:13 +0800, Andy Yan wrote:
> According to the implementation of read_poll_timeout_atomic, if the
> delay time is 0, it will only use a simple loop based on timeout_us to
> decrement the count. Therefore, the final timeout time will differ
> significantly from the setted timteout time. So, here we set a specific
> delay time to ensure that the calculation of the timeout duration is accurate.
> 
> 
> [...]

Applied, thanks!

[1/2] drm/rockchip: vop2: Add delay between poll registers
      commit: 9fae82450d8a5f9c8fa016cd15186e975609b2ac
[2/2] drm/rockchip: vop2: Only wait for changed layer cfg done when there is pending cfgdone bits
      commit: 7f6721b767e219343cfe9a894f5bd869ff5b9d3a

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

