Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D17ADCCD19F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 06:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DFANFfBDNfwmZS1bR1NCqrK1UHkNYLSanN2dGOSuM3A=; b=L/gk8Dv8551VAyQGmJpei/ji08
	fxmgXRgCgUtvlIi3E2X2EfFK5RbqRyvrORmRJE6MYzoDBekV59wyNXuCn0zjaISgyqt6GJz17gH8w
	qRxPH3FppFQtv4Kw9wQ7H3SsXxu//S/DJ6YwBunLlZEpyI0uWnWLiBYOvBCkXFGfhL57z9ncRrEvR
	MyBxyqJ2Qp3MFtf2nFVp00bwAwe9YBhSkqJRwiqOK1wQTOn/4WIN0twJinR9hHFkzxnK9eQx4HNUa
	RjciTuOnxLaw0/NNa6478yI7WYoAPNR/6cgE84trYFy/lwxZpF3fi1Q0PrePqRCwFSuqSqjr33x30
	zRy5dvAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB6HW-0000000FzSf-1Lvk;
	Tue, 21 Oct 2025 06:55:42 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB6HT-0000000FzRA-40aU;
	Tue, 21 Oct 2025 06:55:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=DFANFfBDNfwmZS1bR1NCqrK1UHkNYLSanN2dGOSuM3A=; b=VL0LgpC7cBFIhouCJRLnPx2gJ1
	TuanLtezDC53PVxzz/0H1xG5Bjg6zI/yEOpKAS39hAb2vtIeo5/ZD3FZ+TNJkdUkih4m93OAdQPZO
	NHmq18Z0P8/7lT5o4VjtXHncTsNScDaB7kNM/UQqG4hNuZrwLW3Gf2kBD54E1wxz/YavdY3VjgI4A
	uMM8iUa357mODJGIBHI6E3HRi7KFPeeyB0fSZX1Wq4zihRuWySYd7D/6KXmUL4/dooI6jIl5nBOne
	VF9vhQqFqSZ/UOY/yvD9VoB/2Cy+wgBywkALZlMPwxGi7p5u+cq5ubGBZ/eC4dnX9hO3/tGpLulE8
	y5JLkD9w==;
Received: from [212.111.240.218] (helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vB6HO-0000XV-AT; Tue, 21 Oct 2025 08:55:34 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: mturquette@baylibre.com, sboyd@kernel.org, sugar.zhang@rock-chips.com,
 zhangqing@rock-chips.com, robh@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, Elaine Zhang <zhangqing@rock-chips.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, huangtao@rock-chips.com,
 finley.xiao@rock-chips.com
Subject: Re: [Resend PATCH v4 0/7] clk: rockchip: Add clock controller for the RV1126B
 and RK3506
Date: Tue, 21 Oct 2025 08:55:33 +0200
Message-ID: <8637519.NyiUUSuA9g@phil>
In-Reply-To: <20251021065232.2201500-1-zhangqing@rock-chips.com>
References: <20251021065232.2201500-1-zhangqing@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_235540_035179_D0172F54 
X-CRM114-Status: UNSURE (   9.42  )
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

Hi Elaine,

Am Dienstag, 21. Oktober 2025, 08:52:25 Mitteleurop=C3=A4ische Sommerzeit s=
chrieb Elaine Zhang:
> Add yaml and dt-bindings for the RV1126B and RK3506.
> RK3506 depend on patches 1/7 and 5/7, so it is merged and submitted.

thanks a lot for also including the rk3506 :-) .

I was about to start looking at the rk3506 clock controller,
but can now focus on the other parts of the soc.


Heiko



