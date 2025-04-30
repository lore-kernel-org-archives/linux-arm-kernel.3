Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18048C369D9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Apr 2025 08:29:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:In-Reply-To:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r0lzQPeD0TToeRVN66QVOhI3MZ56kDdIBrvCu7NCmjw=; b=0LUXZp9hbjfIPWMO185ynseH2D
	4X2SJ1bMhyToU8iAiBFRn0SbQYp0SK+MZR1KTServqpFbunKfTDNixsh6WvWkgOseaRPPH2m4nm5t
	TfXg2mICi1Pk5fSTvbR7c70BMUQe9th+u9InyqQe7CfyXed4AcxfirY88qPNbeRvwtnE/eteDeAQX
	n1+f9HMElQgmnIbpjNdoMRU8nTBnxwTj6fYrL1xnieRum1TbjfXTQE5hsEWzB0G+SV5y/LEHYKkvu
	2e81IajnYjkwZs3OVIZQqLd8pEdOUXCTuMY4npnNG2x7NTOOPdMx9bf7AvByCExj04z1YMwowVteP
	ZmQgdr2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA2on-0000000C9R0-2gdw;
	Wed, 30 Apr 2025 08:29:25 +0000
Received: from mailout4.samsung.com ([203.254.224.34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA2Q6-0000000C5Pv-2Nap
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Apr 2025 08:03:58 +0000
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250430080349epoutp047490a7adcc364cb87928a743d3f68bca~7CfVBGI5Y1376313763epoutp046
	for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Apr 2025 08:03:49 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250430080349epoutp047490a7adcc364cb87928a743d3f68bca~7CfVBGI5Y1376313763epoutp046
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1746000229;
	bh=r0lzQPeD0TToeRVN66QVOhI3MZ56kDdIBrvCu7NCmjw=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=SbzC+k1yEJFb3FK3TVjh7wn2XicZsCZfGw1ZNk7kucXn4PPDG1tXuXG/OxWgmqsYe
	 TE8TsWWS5PtMgQN+686m4uAk8agDj10Fi/4U7Ut5A5EZ8SHRKN5jQLyX4J1ZAVgSom
	 ublS/E1Y1P9vFa04/dxP5Es8HKYhqKeKdZ9qxEbQ=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20250430080348epcas5p29f981d5f79ac379b9a4e6f0e2eb20ea3~7CfUTQvmo1973919739epcas5p26;
	Wed, 30 Apr 2025 08:03:48 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.176]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4ZnV7Q6z4Yz3hhT4; Wed, 30 Apr
	2025 08:03:46 +0000 (GMT)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20250430080346epcas5p1ab9a54e2a451f0c273606be005a4c6a8~7CfSCb2ba3050630506epcas5p1v;
	Wed, 30 Apr 2025 08:03:46 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20250430080346epsmtrp2074fbc2854c58cfe9b1c566da8a38641~7CfSBjNNW2131021310epsmtrp23;
	Wed, 30 Apr 2025 08:03:46 +0000 (GMT)
X-AuditID: b6c32a29-55afd7000000223e-d4-6811d9622a01
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	6A.08.08766.269D1186; Wed, 30 Apr 2025 17:03:46 +0900 (KST)
Received: from INBRO002756 (unknown [107.122.3.168]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20250430080344epsmtip1b5735d0f9aba6e2aeb8b6cb5da022a0e~7CfQAw4_x2209522095epsmtip1w;
	Wed, 30 Apr 2025 08:03:43 +0000 (GMT)
From: "Alim Akhtar" <alim.akhtar@samsung.com>
To: "'Pritam Manohar Sutar'" <pritam.sutar@samsung.com>, <krzk@kernel.org>,
	<s.nawrocki@samsung.com>, <cw00.choi@samsung.com>,
	<mturquette@baylibre.com>, <sboyd@kernel.org>, <sunyeal.hong@samsung.com>
Cc: <linux-samsung-soc@vger.kernel.org>, <linux-clk@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<rosa.pila@samsung.com>, <dev.tailor@samsung.com>, <faraz.ata@samsung.com>,
	"'stable'" <stable@kernel.org>
In-Reply-To: <20250428115049.2064955-1-pritam.sutar@samsung.com>
Subject: RE: [PATCH] clk: samsung: correct clock summary for hsi1 block
Date: Wed, 30 Apr 2025 13:33:42 +0530
Message-ID: <0b1b01dbb9a6$65bdd150$313973f0$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQJRzV9wh12IZchi0K7svot8vU81fQE18kpXssYBMwA=
Content-Language: en-us
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrDIsWRmVeSWpSXmKPExsWy7bCSnG7STcEMg9/veC2uf3nOanFvxzJ2
	i2s3FrJbnD+/gd1i0+NrrBYfe+6xWlzeNYfNYsb5fUwWF0+5Wjy7t4LN4svPB8wWh9+0s1r8
	u7aRxeLT+QtsFk3L1jM58Hu8v9HK7rFpVSebx+Yl9R59W1YxenzeJBfAGsVlk5Kak1mWWqRv
	l8CV0fLgJmvBBdGKudM72BsYfwl2MXJySAiYSFxqXMfUxcjFISSwm1Hi97UbzBAJaYnrGyew
	Q9jCEiv/PWeHKHrOKLH0wX1GkASbgK7EjsVtbCAJEYErjBLTfn8Fq2IWaGOSWN7fDdUykVHi
	8Ov5LCAtnAIOEnOezgfbISzgLnFl60U2EJtFQFXi+7TvYPt4BSwlPq3uYIGwBSVOznwCZjML
	aEv0PmxlhLDlJba/nQN1q4LEz6fLWEFsEQEriU1zVjND1IhLvDx6hH0Co/AsJKNmIRk1C8mo
	WUhaFjCyrGKUTC0ozk3PLTYsMMxLLdcrTswtLs1L10vOz93ECI5QLc0djNtXfdA7xMjEwXiI
	UYKDWUmEd0ONYIYQb0piZVVqUX58UWlOavEhRmkOFiVxXvEXvSlCAumJJanZqakFqUUwWSYO
	TqkGpun7XDb48dduknCdL5646P2NxUnu5o/O5+iuznJ1VDzwsf3nZ3X9BttSgScmN3mu/mz5
	9uMeo6Te9rTWRL+Vas9tAlN+Tl80/WhXBee74Msls6YETJ/6ZeH6RP61E1doxIb+UxQ+bl7c
	Y1Vy86SDcmnel6wfHh+KKy/6fXncc35qiKzJaiEbjQvhTrHh2+dqV9YHbnxY6xjxrmuz6R25
	OX3HXyt4mR1u63qZPyvLoL5wYYlBt4jgNa5jvWr7Q79+6Tl6dPKWcEH94hW712aHCs1iMQie
	emTB3Kkb/NUaOE9OLxVYlXY4tXSyQVfVSweTKsc7x79adwp8NrVavYdlTwKXtFzIV1Mje812
	1ahKJZbijERDLeai4kQAVdW7wj8DAAA=
X-CMS-MailID: 20250430080346epcas5p1ab9a54e2a451f0c273606be005a4c6a8
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250428114053epcas5p450f97a4b8e41a1b06606e695e8c19f5f
References: <CGME20250428114053epcas5p450f97a4b8e41a1b06606e695e8c19f5f@epcas5p4.samsung.com>
	<20250428115049.2064955-1-pritam.sutar@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_010355_241596_9F5DC0B4 
X-CRM114-Status: GOOD (  21.24  )
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

Hi Pritam

> -----Original Message-----
> From: Pritam Manohar Sutar <pritam.sutar@samsung.com>
> Sent: Monday, April 28, 2025 5:21 PM
> To: krzk@kernel.org; s.nawrocki@samsung.com; cw00.choi@samsung.com;
> alim.akhtar@samsung.com; mturquette@baylibre.com; sboyd@kernel.org;
> sunyeal.hong@samsung.com
> Cc: linux-samsung-soc@vger.kernel.org; linux-clk@vger.kernel.org; linux-
> arm-kernel@lists.infradead.org; linux-kernel@vger.kernel.org;
> rosa.pila@samsung.com; dev.tailor@samsung.com;
> faraz.ata@samsung.com; Pritam Manohar Sutar
> <pritam.sutar@samsung.com>; stable <stable@kernel.org>
> Subject: [PATCH] clk: samsung: correct clock summary for hsi1 block
> 
> When debugfs is mounted to check clk_summary, 'mout_hsi1_usbdrd_user'
> shows 400Mhz instead of 40Mhz. Snippet of the clock summary is given as
> below
> 
> dout_shared2_div4           1 1 0 400000000 0 0 50000 Y ...
>   mout_hsi1_usbdrd_user     0 0 0 400000000 0 0 50000 Y ...
>     dout_clkcmu_hsi1_usbdrd 0 0 0 40000000  0 0 50000 Y ...
> 
> Hence corrected the clk-tree for the cmu_hsi1 & the corrected clock
> summary is as mentioned below.
> 
May be just " correct the clk_tree by adding correct clock patent for
mout_hsi1_usbdrd_user "

see: https://www.kernel.org/doc/html/latest/process/submitting-patches.html

> dout_shared2_div4           1 1 0 400000000 0 0 50000 Y ...
>   mout_clkcmu_hsi1_usbdrd   0 0 0 400000000 0 0 50000 Y ...
>     dout_clkcmu_hsi1_usbdrd 0 0 0 40000000  0 0 50000 Y ...
>       mout_hsi1_usbdrd_user 0 0 0 40000000  0 0 50000 Y ...
> 
> Fixes: 485e13fe2fb6 ("clk: samsung: add top clock support for ExynosAuto
> v920 SoC")
> Cc: stable <stable@kernel.org>
> Signed-off-by: Pritam Manohar Sutar <pritam.sutar@samsung.com>
> ---
>  drivers/clk/samsung/clk-exynosautov920.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/samsung/clk-exynosautov920.c
> b/drivers/clk/samsung/clk-exynosautov920.c
> index dc8d4240f6de..b0561faecfeb 100644
> --- a/drivers/clk/samsung/clk-exynosautov920.c
> +++ b/drivers/clk/samsung/clk-exynosautov920.c
> @@ -1393,7 +1393,7 @@ static const unsigned long hsi1_clk_regs[]
> __initconst = {
>  /* List of parent clocks for Muxes in CMU_HSI1 */
>  PNAME(mout_hsi1_mmc_card_user_p) = {"oscclk",
> "dout_clkcmu_hsi1_mmc_card"};
>  PNAME(mout_hsi1_noc_user_p) = { "oscclk", "dout_clkcmu_hsi1_noc" };
> -PNAME(mout_hsi1_usbdrd_user_p) = { "oscclk",
> "mout_clkcmu_hsi1_usbdrd" };
> +PNAME(mout_hsi1_usbdrd_user_p) = { "oscclk",
> "dout_clkcmu_hsi1_usbdrd"
> +};
>  PNAME(mout_hsi1_usbdrd_p) = { "dout_tcxo_div2",
> "mout_hsi1_usbdrd_user" };
> 
>  static const struct samsung_mux_clock hsi1_mux_clks[] __initconst = {
> --
> 2.34.1



