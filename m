Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9944C282D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 13:39:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KfevJUMvlkYaiwWPH0v/jOLdrYSk6S1xx5iNuGnoYDk=; b=xz63b/uO2Dh4vgaFuELHxOAssG
	SBVPH0UfSvci4y9Cx5IKtk2ZAwUPxm0R7DjQpxv/I0ErHm9H9BwR4DLoCiWiIvHeBVtHS7eDlM8nJ
	dwrotSu+JeGi5S9hXV84OxMPvzuLyu9fwGiCSxOaMLZlMKWjevQWdImQVjGv+RXX76ZvoekfGDQol
	6+jh34Mdun6HNFDxGE4qeL2Kr8kKLDYnGLd43f1BwwgdZaEM3BqbOyiO8XDQqPBwHcuAf/qFWxTJW
	DpnCHcwrJoQsSX88eRKcvsyfzGAd2/ABGjZi2zsrgAVPtwjmxEXLMhX4OzhzkGbMuYWGh/C4Fw3Y8
	jIzAJoSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqBRH-0000000B4v6-1Hti;
	Thu, 06 Mar 2025 13:39:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqBIW-0000000B3mf-1CXQ;
	Thu, 06 Mar 2025 13:30:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=KfevJUMvlkYaiwWPH0v/jOLdrYSk6S1xx5iNuGnoYDk=; b=TI0Y4d70f5Z4XEYx/9GP5WM1Fj
	tgBRiKKaCqnU+3ES1SUlpsqYxdwfSvRcWMQ67sHKt2KGRzS7bLP1zBG4ot+jyjBVARHSM9EEiIDPz
	Csf90HkMJc4pU0KOgewmQUV9hSZdV2zbKhZYOzAETrKGgkecxe1Ckwrb8nR/7Cwex50pbq/2lpBpw
	OCam4f0kEKwDKwC1rMooSe4MvSrRgQN+7HAZgbQfLIYkzF1L0+tzou211vUhtbk9WmsMzQsHkIsS9
	Bgnk0E1kDpGRHW/oFp3scWu7iD3pAjzUuIv7sBR+toWWDEZSVWQ0JqIGO3jnwfSlB/x9D9+XypbB/
	LIeqB/NA==;
Received: from gloria.sntech.de ([185.11.138.130])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqBIT-0000000163X-1ORC;
	Thu, 06 Mar 2025 13:29:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=KfevJUMvlkYaiwWPH0v/jOLdrYSk6S1xx5iNuGnoYDk=; b=0svrTxlhNNIVme+4UfyrOlWYMB
	5p0qzLwWeudr9sxtfeG2v9ShCEUMrPSDdh1TMjfP7iB2j7Z4XcGjVb5CWOtt6mPjdim8xQR5BgrP7
	Zt6oKedkl8RolRZDyw5HKmTnkPsRDwPui9/qUOn+aW2CafAUprYUWsn5JM0zdvrgGhuYLWAqReNsX
	cID6f3+oomXKrTnnabtV3tjy172XGATbwxy3zoFaVpzEP5RS3b5ZwQggTxu87X50UV92eLRbZD9tF
	dJ6dyBJNnigrITtZdZZahDnh0OYtbEjusVGd6YFLCW3/viUAzl+TbV7VrOxfbDfEZ5YrCsQ7TZin2
	3wHszQbA==;
Received: from i53875a38.versanet.de ([83.135.90.56] helo=phil..)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tqAye-0003Cs-2N; Thu, 06 Mar 2025 14:09:28 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Andy Yan <andyshrk@163.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	detlev.casanova@collabora.com,
	kever.yang@rock-chips.com,
	krzk+dt@kernel.org,
	cl@rock-chips.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH] arm64: dts: rockchip: Enable hdmi out display for rk3576-evb-v10
Date: Thu,  6 Mar 2025 14:09:23 +0100
Message-ID: <174126656184.656541.9194102170806137461.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250305025128.479245-1-andyshrk@163.com>
References: <20250305025128.479245-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_132957_453700_C4FFE5AD 
X-CRM114-Status: UNSURE (   9.65  )
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


On Wed, 05 Mar 2025 10:51:11 +0800, Andy Yan wrote:
> Enable vop and hdmi on rk3576 evb1, so we can get a display output
> on this board now.
> 
> 

Applied, thanks!

[1/1] arm64: dts: rockchip: Enable hdmi out display for rk3576-evb-v10
      commit: 7641678ecb0c242498e2a3b2b0621961653a7c2c

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

