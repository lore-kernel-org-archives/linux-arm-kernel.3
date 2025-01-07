Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FB5AE77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 11:07:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:CC:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=93Rb+Ogkxz3F4UcRyaPH1HS1f7gZEjIEkrgdACGwwuk=; b=ySNhYMc0JECxukfqtYUiQelsca
	5ZlAQ+/MsXJWpmQAr1H0MJ0TVgLXCYY0MartoVddiNsm3uxdlAZib9dgBMHlKTX/eK2xXn0/Pz146
	hK1S51SuU8vIc5HUDde5Wqa9gNGR/1cpJRPdoOEVIYkHi1rGlRWwnXcBxnrW28FWEXhDxx3KBrfgc
	Cco2n9HzCVDlnovs/M+NpV6wiP9VtCGjFtLyDAj6Q0/coC6jWMePYwULruVVr2rOA5BOIJPPq1HFG
	eKzrhkVlWs2FpP9CVsyWya8hIs+nYoxZDpZnFahVYHMMdxYVhBlg4HGyhYAQkOF9muFObqXWNVAzY
	BybEzz3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tV7QW-00000004UVs-1sXN;
	Tue, 07 Jan 2025 11:07:12 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tV7PE-00000004UFK-30Ql
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 11:05:58 +0000
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5079JpOV026708;
	Tue, 7 Jan 2025 12:05:36 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	93Rb+Ogkxz3F4UcRyaPH1HS1f7gZEjIEkrgdACGwwuk=; b=mh2QRgB08IDXzC+U
	BmwYIOLcWK0qAYMBVvbB87uoyS7SXLCjlj16b+tYqXXXFVvZ0oriOtPMVYsgl7uW
	/DzkR2boobP8NnBRkxVnAOV8nTD/3k8JB5W4QjqDbyrU0byRGsQPHJM1d8i8g6q8
	w/8qjrs0sYRSwTvcivKVbbg1O5dilr1y+6iSEORwCYolIqiAZO+MhxnJKruMzZi/
	WFndIvLr0p/gK3dHaESlCOBaFyX2DdT0kuUBh6IsAB8lXSVF/rvWyC8XHhpOLsh5
	RuIEaz8HdHKeMBMMpOkMwUWHv1PyRBYfTjPt93HFJpTouK5R+ODDU+RWMfs3sXGA
	zLOGZQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4410vgrrxm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 Jan 2025 12:05:36 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 5756C40048;
	Tue,  7 Jan 2025 12:04:30 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 112D22649E9;
	Tue,  7 Jan 2025 12:03:47 +0100 (CET)
Received: from [192.168.8.15] (10.48.86.148) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Tue, 7 Jan
 2025 12:03:46 +0100
Message-ID: <2f37dd23a4bf04c5c66aa193c6604f24a5f59011.camel@foss.st.com>
Subject: Re: [PATCH v10] pinctrl: stm32: Add check for clk_enable()
From: Antonio Borneo <antonio.borneo@foss.st.com>
To: Mingwei Zheng <zmw12306@gmail.com>
CC: <marex@denx.de>, <linus.walleij@linaro.org>, <mcoquelin.stm32@gmail.com>,
        <alexandre.torgue@foss.st.com>, <make24@iscas.ac.cn>,
        <peng.fan@nxp.com>, <fabien.dessenne@foss.st.com>,
        <linux-gpio@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        Jiasheng Jiang <jiashengjiangcool@gmail.com>
Date: Tue, 7 Jan 2025 12:03:43 +0100
In-Reply-To: <20250106220659.2640365-1-zmw12306@gmail.com>
References: <20250106220659.2640365-1-zmw12306@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 
MIME-Version: 1.0
X-Originating-IP: [10.48.86.148]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_030553_214341_CB0D349D 
X-CRM114-Status: UNSURE (   9.60  )
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

On Mon, 2025-01-06 at 17:06 -0500, Mingwei Zheng wrote:
> Convert the driver to clk_bulk*() API.
> Add check for the return value of clk_bulk_enable() to catch
> the potential error.
>=20
> Fixes: 05d8af449d93 ("pinctrl: stm32: Keep pinctrl block clock enabled wh=
en LEVEL IRQ requested")
> Signed-off-by: Mingwei Zheng <zmw12306@gmail.com>
> Signed-off-by: Jiasheng Jiang <jiashengjiangcool@gmail.com>
> ---
> Changelog:
>=20
> v9 -> v10:
> 1. Move the id assignment into pctl->clks[i].clk assignment loop.
> 2. Remove empty lines.

Reviewed-by: Antonio Borneo <antonio.borneo@foss.st.com>

Thanks!
Antonio

