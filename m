Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E75510F9303
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Mar 2026 20:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HddPcSAbUNS8veYlTx2o5Se91feKqDMffrj4xcj/ilE=; b=bc6/6y7fBn92pAHr7VsOLISFDv
	b+UZDy6Rw0NQdDJ/XqQVRSCmOe1LbGO4mGU7Ory37S5zo6KdUZeqtGIbVJ82OWZCSQpOY0O+Xr4ua
	zMdwf+A8gqLazB2pHYDhzL3x0B0RuEPOuBJGlXC1GgplLx5lb1nx/AYdn4WRGh/Rmb7jJAPOKLq7P
	AI2p3yG1IrKAc6mg8DPIKRQxAABH2E7YQxfuHlu6ANWpoQ7Sb03TBw/mpWA05oZHcd89PadMSK4po
	5Ia5IDWM1gxAgDOj22yv8IIlt5lBgCONB7Se2jAoKi2+ZjxwTFQYFcRH4jB4Q/gDHeCdF093Y/aGb
	KBROJ5PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7gAs-0000000DYKc-1tUv;
	Tue, 31 Mar 2026 20:58:58 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7gAo-0000000DYK9-41gD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Mar 2026 20:58:57 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62VGdHcf1831866
	for <linux-arm-kernel@lists.infradead.org>; Tue, 31 Mar 2026 20:58:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=HddPcSAbUNS8veYlTx2o5Se9
	1feKqDMffrj4xcj/ilE=; b=nfMp43OvPKg9eH1vcdrAPIcAYlhRnyjwneuIP46G
	95nmc/u5yohrbiDrFUCHs6ZXEnG5EYXm/spSAwdxyXOkNvaHJ99r/HtY+iZHzEn/
	3fKvEOb+JWTFsKJpS92+tez1J2hGKS2ej7F00zGeKqCtTHM+7bnyz20x4k/2EgyJ
	EIrLrDC1ONnIwrzo1Q7H/ljKWZjcN0DIDydUF3RvLlpn/fi240m/I+QVmzv0Tgvz
	mjndNVO19zI2XiJVyfemN9TiyOeibZfO6gxfohI0Dn2eRQb61gfZ6hVcBmULUZ/S
	SqLtMmQMPufxo/jv5e5PRFf1Wjl/+1Oy5FYxWBOrXavc8w==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8equada2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 31 Mar 2026 20:58:54 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82c4664f75fso4772878b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 31 Mar 2026 13:58:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774990733; x=1775595533; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HddPcSAbUNS8veYlTx2o5Se91feKqDMffrj4xcj/ilE=;
        b=ECXlidZpXviBrYB42Ol1LH2iZfUP8XzePHAKKVPlLecIgjN/bXRQvnE8QhFpjUPG5K
         oPRxrgoXKEu2tbUZUZVniWctW9+/9474SQzVotYzkpKFkJNYtOx85MNmbUeoFz/jZ+ZT
         hXCs7s8wHuoTCbe9vQIVGhKNDsWXo60BAHDQxbdmkiI77KFDm4Rph3lFO3tDUozZD50q
         SwPjWIDy7kY/RUeGwFyy+hwwR8A7A7jMYhPguCnT5nzscXXuqkmNuCgF4+hhefIiI63o
         hBPNe6H/D5XzffrSj/HiQ4iJVN4h9YORKOIy5ODFjd9IFIAb9K6CGnH6ZazvPDqkuTmv
         yO5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774990733; x=1775595533;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HddPcSAbUNS8veYlTx2o5Se91feKqDMffrj4xcj/ilE=;
        b=GHnkzO3cV/Mp6o0ZNSVJ4OJPifcFQRhCXwt4FDljbYwjJsiBOgvgir9G113H/H3U7S
         dufFDwu411ThX/MrezV1t8uUTeqFt/91BnnaTmSCa2qImbmqHE5s0lecizmVrAQ4K+zm
         0vrm8UrYbqnbZFk0FCQiwsXYCNuhWwtZPrByqq2z0iL/7E7w5Mk2FRVYi1mAEI6uHMqP
         LybNJoHum/Ult1mG0yQ7cu4AIyviMSAWfx5DQKvl5o4n2PreJZNeM5Y9wZSWNANFyOtm
         GnOGgy2YitohnJxn9JmIdzB0K64xpvUqy1yGQkBGM2IglTAvG3mu65kHDXyhbpojnRd/
         Jsyw==
X-Forwarded-Encrypted: i=1; AJvYcCWqJUexpY9pIl59Wa1clK+r1k79hzhoDRbUchvayoKiVQiBo7ya++HE2RvbARAM46a8BkfsXS1NJhuD/EaFCH+R@lists.infradead.org
X-Gm-Message-State: AOJu0YxVbwEnfo4iCJVzsryIRTIZ1LF6abdD2/QyKMPC71lp/FmF9/o9
	t9LikveWClEnhXEALkY1jtgku73UK8j8ctTdF4eHIUqMyxO2HpLJ2T/Y4Bfutg5PEL3udrwUIyH
	voFx9ps1d03lGOHd3G2KXtuKikio1GGFXyzd1So2A7hzr/LFu3J2YIDJffkFO02VA5POvH2v7GW
	/dow==
X-Gm-Gg: ATEYQzxsEx/bXSdEStYldeAm9QygMHuHdM1DibSwOmDyDhJ1Rmiz0yTW6sbB4IYg7AK
	4AcKJJnGKai7ZAeUvu1jlVvMJdj0d3j8L4Yxs7E93Eit8NYxwDGZbms5mbVGR8dZMSO7asNQiTn
	yx/RwdpJuXP31aFXgl2TCzNMB41Qv+d6xx4UMI+UBUtc3bJyJptOOQe8TaG4QtNkd2tHwg1sKxD
	DZRpSwS81RKkcePUFjtUBtGCFodCAf0xkUoeMYqnpM1/98DC6usPtflhWKof9wLmokyK57tOILL
	ROdIZfAHiZD8CtQXYcJZ/zxBPHO8ABuPrawP6YnY+bbMfc4omEA+7omaj3DBBEBcfsM/EQNWC9i
	YWbeanm7kESGPNuJgTXDaB3G3+uJyFPWEKWI=
X-Received: by 2002:a05:6a00:84d:b0:82a:60ad:874 with SMTP id d2e1a72fcca58-82ce8957d6dmr1039514b3a.19.1774990733353;
        Tue, 31 Mar 2026 13:58:53 -0700 (PDT)
X-Received: by 2002:a05:6a00:84d:b0:82a:60ad:874 with SMTP id d2e1a72fcca58-82ce8957d6dmr1039494b3a.19.1774990732800;
        Tue, 31 Mar 2026 13:58:52 -0700 (PDT)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82caf97abfesm10359545b3a.1.2026.03.31.13.58.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 13:58:52 -0700 (PDT)
Date: Wed, 1 Apr 2026 02:28:45 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Andrew Lunn <andrew@lunn.ch>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org,
        Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH RFC net-next] net: stmmac: qcom-ethqos: set clk_csr
Message-ID: <acw1habUsiSqlrky@oss.qualcomm.com>
References: <E1w6AZm-0000000E54W-1F6E@rmk-PC.armlinux.org.uk>
 <9d0a529a-d065-4f46-a93b-23195a4f9727@oss.qualcomm.com>
 <acpqgpCsbo3lJs3l@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <acpqgpCsbo3lJs3l@shell.armlinux.org.uk>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDIwMiBTYWx0ZWRfXwXlYEWzeH3FN
 Jo9JRpcqxfqBWLpBFSeYEFRYSzpOincb3UBW0DvpGfoGLb86EnPBCqwg1Cr0M2x73k+keRZtQQu
 AQ3tf4t70LcAK1HXoiDs1BkdFQrsfQeeVOmuasIKq3El/b9sqnQ8tdQp/jzWMBwC2b4IGMSZpYI
 LGsP5wElF1vY6vTyqhygsCPjcwGUYFq/bUwL6H0I19OtUWjkH9tKHdwdHdvGsrCRy2wqP89Y8w5
 tPzTgD7LletcVsDbL3IiprqSn3pnsXU8eiG8zVgZhHDxvTXW0j5bq+7LuZy+woKD4Qa3f7c1RC6
 VBnA9A+cZcvuBIrBjo9gZoJxmRcb4dHedH4X6E2bbzg1xVSAFfBHfk89r+8VEkgNs8R2IHPh/hD
 RE5zKSQPJbiXayglHxQwChLbhSuVBSf4HoHo2zvd4cdEI5J4+l6eG2Br1OZOO2DBzqG8JDv1lH+
 xLcrJVpAUUINGzj1ARw==
X-Proofpoint-GUID: W3lTZc22pgCDgKOtJwla9-z3s3APg1e9
X-Proofpoint-ORIG-GUID: W3lTZc22pgCDgKOtJwla9-z3s3APg1e9
X-Authority-Analysis: v=2.4 cv=YMOSCBGx c=1 sm=1 tr=0 ts=69cc358e cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=9WimFISaW_B1XMulNl8A:9 a=CjuIK1q_8ugA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_05,2026-03-31_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 spamscore=0 impostorscore=0 adultscore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603310202
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_135855_035934_F133610B 
X-CRM114-Status: GOOD (  22.97  )
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

On Mon, Mar 30, 2026 at 01:20:18PM +0100, Russell King (Oracle) wrote:
> On Mon, Mar 30, 2026 at 01:18:56PM +0200, Konrad Dybcio wrote:
> > On 3/27/26 6:02 PM, Russell King (Oracle) wrote:
> > > The clocks for qcom-ethqos return a rate of zero as firmware manages
> > > their rate. According to hardware documentation, the clock which is
> > > fed to the slave AHB interface can crange between 50 and 100MHz.
> > 
> > FWIW this __may__ possibly differ between platforms, but I'm not sure
> > to what degree. Will there be visible impact if we e.g. have a 200 or
> > 300 MHz clock somewhere?
> 

While I had made an identical change while retesting the PCS series,
I was holding off on posting this patch for the same concern - what
if some boards fall outside the 50 - 100 MHz range.

After some digging, the AHB clock appears to operate within:
 - 50 to 100 MHz for lemans/monaco derivative boards (2500BASE-X
   interface)
 - 30 to 75 MHz for boards with an RGMII interface.

This is not exhaustive, but it covers all boards I have access to
which actually boot with the upstream kernel.

Therefore, I think using the /42 divisor should be fine as it will
ensure that MDC never goes beyond 2.5 MHz.

If a future platform exceeds this range, we could switch to something
like: plat_dat->clk_csr = data->clk_csr, with each EMAC version
selecting the appropriate divisor.

Due to some urgent work tasks, I am still finishing PCS series
testing. I will provide a t-b once done.

In the meanwhile, please feel free to add:

Reviewed-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>

	Ayaan


