Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE907C9830C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 13:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qq6xeq+5N6XfyP0fS9pBoOWPw0EfK2lsnoPvPTiFh/k=; b=wZvb/4ZtJ7Rp65YFYiBgWIoCyh
	aG9moeDwvMmV0+Fbbl5+iehq6z1sTUMhAf/77/7682PAWg2Ob+3OEvXnhZE0COrnKhEsAyhxx3YTM
	/anhfaC5kxYuV3ygdlTRslvYvHo4sUUipP+kUNu3FsX/D0HCbApGYyUek5ooTfVdtwU7qq/DvxkO9
	rzQl+rYobm2yjv8Gaq9HeiC/eNY8hyrNG/iEc6d+u4NqqL1WCbzj3NXG861GzQv0gef89hXpNHyOZ
	sLYjFv2B3Aaujyk+4z4yO4T9xFhs/Y1lsC+fuuhN8eQGU10zminGtI2EsmTXUVP2yY+Rgma5QRIHZ
	lnpfeE7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9N4T-00000008P0o-1dcw;
	Wed, 23 Sep 2026 13:31:38 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9N4P-00000008P05-1BAK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 13:31:34 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NBbYW83413935
	for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 13:31:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Qq6xeq+5N6XfyP0fS9pBoOWP
	w0EfK2lsnoPvPTiFh/k=; b=Xe7bp9sbIhdsqaUU+Tp+K0Y+SLJ+Vscvz99AoTUM
	JXaeKQTGH7Y2onQk0FVAHZd7oIZxf+r9U/22PbkJ+HFqBn+hhnY6D4NRMDSsOJjw
	UmFVWC+Ft9yf4ZBtuGLaH99BwdE2GIv9MMgxol+PhoYAk3e+VJtlPpSgUuUMNbu9
	bzJk2jbU5YYUQaFMoSPgyss/rCskrML562gC4vToTHNy/NJ3HS3zCN91njsZ5T50
	x06PJt34V+fDI90RaNbbz4mU0QlIuCsdg4w8tl+VVR8a+gzI64QLHBcVbkyCqon0
	V2D6Zd8YLVfX30mWUn5REjYQf4nFSXPfaOXmqy8XUhccdw==
Received: from mail-yx1-f70.google.com (mail-yx1-f70.google.com [74.125.224.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gv78n26y2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 13:31:32 +0000 (GMT)
Received: by mail-yx1-f70.google.com with SMTP id 956f58d0204a3-671321441d1so1137229d50.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 06:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790170291; x=1790775091; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Qq6xeq+5N6XfyP0fS9pBoOWPw0EfK2lsnoPvPTiFh/k=;
        b=JGw63x3RoxWdiKz4jHiCtvkp79Qg6P/BXoAtwTCLei41x5aC1L0om6AXsZmTiox1j8
         fvdd+KzqtI1jNI96bD27fog57aEiLzQm/3SrprB1Y+9EfpygUIKYRlinESWYDqIhobFt
         h+384vjVSKDmTIv1cJTkB+IY3wozscWvW2WK5X2qU+EY40UE20kD9dRmYbjnCbmoEaCM
         y0VfoshFBEEJwl8LiH7LBhnBnjy+G9JOkDmR04nZF6DmmDpzfyf6UL3boHoJUDbhxr/Y
         LkR1hyOI5MOvGpfqvvBMSyo3BZRJAatPuC9K+nuaOL9/bN3lL7I2S+X9v/dH+l/kNKv0
         /Ufw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790170291; x=1790775091;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Qq6xeq+5N6XfyP0fS9pBoOWPw0EfK2lsnoPvPTiFh/k=;
        b=SEzsbAi+eC3pb1dklryfIsEP1OeoAwoQ/Z/5UT31HVrew+KjVADIQWQEs3KwKjEfZT
         P5VAdpWg0Td3zCwn3VQiRldZCN4sb2cvgloc+ZqPdd/W5hLq77Axyey+w3pf5LvTmhys
         MUDKLJOwJX9xafCVxizEKaaTS2CHrdSxsozK8t+PMacja7dffm+HsPr5i7ov6YRL54t3
         WCZjmK8wIutbCyKrD4hHjGqhJ7C2kwwde+wghlJVR/qy/+APYd8NmFq3GrMTDD0Aoonm
         X2a8h7oxiFfHEFPdRhvXStSocbe1Nn1/2Kjnwar5bFlTbYuZE9JUqqmkW/K4umNSW5eE
         neYQ==
X-Forwarded-Encrypted: i=1; AKwUvBxmXVHcrHmtr88VIdjkCHrjiqTTcURSPhMrEBJMt2yCytKaZKG/SSOyyjBvdl7mVsltnSRF1pA9WkuinzpWPqKC@lists.infradead.org
X-Gm-Message-State: AFuF++nML/9RrDwqao7HIe6QnmXXl5HlDmbKsvLgDs97MkNQ+5DPlNuG
	cVqkRpzkMAbCWFIYnm8eLSJn8m33JtXoK2xN3rA0xexQG7jw/M81Dsdn6vqX620LMNrdOetGrpu
	39QqY0hGT0Ud+WVp5aNSiJskEdujUqGHAfFYKk1zId2mmSUmy/KqTLDqDkr4tshEcFsggYTXtPi
	J4pw==
X-Gm-Gg: AYBFou2IZeYriI0k8GR+iAc1h5RWUb1NR3RJ7zTHfcckB21UoPHBCDqot5WCFmGzTYJ
	4pIKW9p+9E73bKEDRbE2uaC3tDQ8XVx8BlN4eHnTFPqmQCWlMIaSYQ+zsQ/IDTaNu1F83cgt7ZV
	tTOnb5RFQrtlDxC6fNJHPuqFS8th4egusd9iTezX93HFE7IWc+LBDjGqxjAcpf/UAqIMG2YjvhH
	KZuRJ5b1+7kY8Dgmp3xUeAzvJ42y+AiGBxEw1doOg+6+WN4pf9nFBpkB+QN30S+zCplQMM4bgNy
	EbbDB29DPegYSfUe79WgvVBcz7NQwh7YJuV4QvjsO8D8KCsNJdhDnEXBh5OgeA0sV+k/98SujlR
	7y6E+I+bpVIEn
X-Received: by 2002:a05:690e:4503:20b0:672:a4a6:298c with SMTP id 956f58d0204a3-672d5728d7amr1011761d50.6.1790170291114;
        Wed, 23 Sep 2026 06:31:31 -0700 (PDT)
X-Received: by 2002:a05:690e:4503:20b0:672:a4a6:298c with SMTP id 956f58d0204a3-672d5728d7amr1011687d50.6.1790170290514;
        Wed, 23 Sep 2026 06:31:30 -0700 (PDT)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9140c43b6dfsm20549436d6.31.2026.09.23.06.31.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 06:31:30 -0700 (PDT)
Date: Wed, 23 Sep 2026 19:01:18 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Serge Semin <fancer.lancer@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Richard Cochran <richardcochran@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Jose Abreu <joabreu@synopsys.com>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>,
        Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>
Subject: Re: [PATCH RFC net-next 2/9] net: pcs: xpcs: add USXGMII Clause 37
 autoneg support
Message-ID: <arPUpiLe/y/aKR/a@oss.qualcomm.com>
References: <20260923-qcom_xpcs_nord_emac-v1-0-4b1c682af70f@oss.qualcomm.com>
 <20260923-qcom_xpcs_nord_emac-v1-2-4b1c682af70f@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260923-qcom_xpcs_nord_emac-v1-2-4b1c682af70f@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA1MyBTYWx0ZWRfXyqNpYadYF3fD
 oK7RxGvQUREo04VjygYl8tbmSbDFfYSLB126IumA38VDI/QOzaOnqI9TZz+FYVIsDoUqFwYw2ou
 ipmdOr31yTgkJcG7OLtpSiCL+TOSMI0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA1MyBTYWx0ZWRfXwMxgFJU8pBlP
 SIparAifpht89FXCyI1DXJp57VCA+Ym//rP7tfb9CIXgteY+hkmNwL6Lhg84Hxxl3DxFZP+ky4O
 ABbY5BkhD3w6PCPB7cvTj3/hYKvpAgmUq26jdSEw/0UnC/tt+s/kQb3NQWQwzsX/IDKaHeHAOXv
 9QijVvMfSUva54Vm4g0aW8U2rmP8/gwBJoQJQSJ5nNbXM7iEFbogLu/0Ey5xwpBPZnvCng8jnfD
 bPxL5OlvUgoHFQmrGJWplrAO0IknUCkqnCjHTbzLhazb80ODDLB8xkPAh8+MrEDX5Yyxgtpdemi
 IchcdyTLGUsUkvW5G5WB/chONtynMBC4hU5HGjdIV2pThvn9lap6QkN4eA000U0QhJfwSvDSO8C
 Gl6NdyWXxfWk741PDqnJVsrBKq6O0ehkcy3Ic5h9AkOI6S63Rw9eRfXdJtLNhJSXD6R98LdDJUG
 Hp1mgU0pOc4uum7iUUg==
X-Proofpoint-ORIG-GUID: KEWCczhjR1vQYx2cRIHjjdAecPc5Mc4x
X-Authority-Analysis: v=2.4 cv=aNFlOr9m c=1 sm=1 tr=0 ts=6ab3d4b4 cx=c_pps
 a=S/uc88zpIJVNbziUnJ6G4Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=U1nmBBJXYHZWlwlGUpAA:9 a=CjuIK1q_8ugA:10
 a=nd2WpGr1bMy9NW-iytEl:22
X-Proofpoint-GUID: KEWCczhjR1vQYx2cRIHjjdAecPc5Mc4x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230053
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_063133_983727_5D2A1BFF 
X-CRM114-Status: GOOD (  18.18  )
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

Hi Andrew,
On Wed, Sep 23, 2026 at 06:37:28AM +0530, Mohd Ayaan Anwar wrote:
> The generic DesignWare XPCS support currently associates USXGMII with
> Clause 73 auto-negotiation. The XPCS integration on Qualcomm Nord
> instead uses the vendor MII register block and Clause 37 control and
> status for USXGMII.
> 
> Add a separate Clause 37 USXGMII mode which configures the PCS for
> BASE-R, enables single-port 10G-SXGMII operation and enables
> PHY-side Clause 37 auto-negotiation.
> 
> Also decode the negotiated link, speed and duplex from the vendor
> Clause 37 status register. This supports 10 Mbps through 10 Gbps link
> rates exposed by the USXGMII status fields.
> 
> Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
> ---

Seeing your question below, I think I should have probably mentioned
here that this sequence is given in the programming guidelines of the
XPCS 3.50a databook. Section 7.6 Switching to USXGMII Mode, point 10.
states:
  Set bit(12) of SR_MII_CTRL to 1 to enable CL37 auto-negotiation
  (paraphrased).

So this is a part of the licensed IP, rather than a Qualcomm specific
addition.

> @@ -687,6 +736,7 @@ static unsigned int xpcs_inband_caps(struct phylink_pcs *pcs,
>  
>  	case DW_10GBASER:
>  	case DW_2500BASEX:
> +	case DW_AN_C37_USXGMII:
>  		return LINK_INBAND_DISABLE;
>  

This is incorrect and I did not find out its side effect as I was
working with a firmware managed external sitch. The XPCS supports
USXGMII with AN always, so this case should return LINK_INBAND_ENABLE.

	Ayaan

