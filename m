Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F76910F2840
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 15:20:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ss76jAqWiuezivNC5zEZJoYkXwE9ZyVbXGzY7OaUfHw=; b=Qmi6XBK0aMPANpt36+YplWpzEP
	LcpJFRRSiHvFFtEUGbhgZz0Hv3UcV8awYp9nptdgp/vUpSs70EPxFTTfeZT1BvV/WGfSnYrZhA/yA
	cIuRXkXR8QI0e4YsVjWQrZETXv1LTwHCY2zI7ERseMNs23DoeZ2ZviW6jTbhfdWjAjZWyTutZ1X3o
	B9ilVf14yjfyHJGtAGFz88bJwYbrHdYhNT9WfZ3N/ByBJobmq/swxNbu4D4qGPi6R8QbRx1emzzDf
	SgDxS089680MB1KH2zTSfChVrixXB16ZzEeem3uEz0DnaRUISqjZTUgJGk4cafHWkHyUaoHua9xX4
	vOWRZVMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w68zE-00000007gZ3-30vL;
	Fri, 27 Mar 2026 15:20:36 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w68zC-00000007gYf-17gn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 15:20:35 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62RDh8Uq3747945
	for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Mar 2026 15:20:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ss76jAqWiuezivNC5zEZJoYk
	XwE9ZyVbXGzY7OaUfHw=; b=aI1ApZLNF6MrFXweEsidasxUME6VrN4llo6ogWgN
	FK26tugsLvNNXbScTkuQxxJ2x4CAZq4hGVyXHc0Ny7LsJNqyJ8xPfYg468Kktf7V
	poPtCUCMXryEgglpwszTeSqDlXL861NbWRnYNHMiGlznpEXSgMY7tkrs3azJsRso
	0HRi70nfii+izCGIY9q05lXNSco5rCg5mrvCJ6lXbc5lKRbY5R7OKFc//35xUJfi
	mJVnF7SoOLs7tK4tz8dTjqpKut6HGHGPRAntsOlrRLGgpKuiDMWZdemY+T+2WHi/
	NafbzFBBLmEo0jdaQXioYR0rK2HnJOSSBGhiah1xIND70g==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5sxhgk26-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Mar 2026 15:20:33 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2aeb90532f6so26511555ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Mar 2026 08:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774624832; x=1775229632; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ss76jAqWiuezivNC5zEZJoYkXwE9ZyVbXGzY7OaUfHw=;
        b=hc40x4KXvIbTKsRsZhRlPHqIKGulyvdD0icyq1ST1CFb3cEN+hXVP+6XOFOACbu/zz
         HAjwlBOUOCV4nCSMyG8kF+eLrwm4Hp0J7Bf4//QaOM6F71gFzjt87NkDrM/Jt0vmbcjG
         +VGPv2luvD9sd1RGTKkv17EcTmnMnZNqxsi2eosoFLUvXvi0Wi8mISkzD2cxlq/AJSew
         SeJeemymKdmXBMIJXmfpxnJpQ8tf4ocKbJ0dk7TVR+5KzmdAoui5WHU7hCJjMdh68Meu
         ETIznmCwOeCreYm1lPzdjGYgLFIblZWw+FFbJHHhrBKVK/DELwlrJbWTcnJ679ckfkb8
         Q6DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774624832; x=1775229632;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ss76jAqWiuezivNC5zEZJoYkXwE9ZyVbXGzY7OaUfHw=;
        b=r0kSdQb4cPoxLRMbumJkLAhC/fA4TZ1z+Ci4wf+QUqlxgHHYAth1XsyFFZoYVkIt1L
         VMZa8SZwF4W0jr7oYuSI0Tj5BENU6DM7ZiR4C+VWlIw6q75IvV7sWD4lP3MK/uL4jXou
         aL6wsJFEL0B742RDwmFBvhjbQWss3R8qkihLqTiaeTs7C7n3FLJtTNyuAD8aa8K56Q+7
         PDHlhmCRnVOyoBJuQqNO1GVOlpisGd5WINe1xtMWWTilryg1YCFSmWpAyejkkrw5BwJH
         eOTtIiEhPJ2E5mLHgMGUdw05GREK8UXvh7ndTBOSuosU/efdA1NeBdUlodcavD4Ofpm9
         ohAw==
X-Forwarded-Encrypted: i=1; AJvYcCXckNtmD9cGcP/sn6lHKJK266Rvs3Tlwd8LnEzYfXMPeA5WQHK5JQ6Aa6VqkvqWaR9nBTQWdOX5BTM4RykNK8g8@lists.infradead.org
X-Gm-Message-State: AOJu0Ywemh1B5agUj39XREws14G0N5NrIqTXp4l1ImhXkkv055KOC7zi
	2R/Tzo1QQi5heKsSNKHT7n0/rAUxhUeq8nWe0B2hYQ9GdW/tGkzLomWb+N4ZGVkQTEnM+03UcLX
	lqPPYxZUh/ii6jz2U6fiwf6mk86pu69tlMz3DM+91IcT0q+TIaCGXt05j1uBeWGe/t8w66NPIlc
	2JTWTY11SwlfNz
X-Gm-Gg: ATEYQzz4DQCzEQo96PmmfGIW7vDUoPM1ug7NVTZZVH1xLtkMn6R+cFPagRmLOz11bw+
	WdTRFhHHFn3ztzhEZ6jntrPQwl6wD1IeOjisoN07PxOYAj9lLqduoPQ1tGnAIgQVn74Owx1pugL
	XNsk6FUhov0a3mYZgYBnQ8PIvpQ3Q38bT9xogzYvYEaHbOh603jhP6u/QmKT7qrHs6JXRDTdL2P
	19fXg1e9coDTAziF69ZjROT5/uA9sDOcGj+wvQgBuEtuh5Ohbuj1C4IckjpWKSvyr5UUvL6tWvo
	nkytWbw3WCHQuZS4o7E01bY17YQw/MpTgefO0zLoycra06gJqygjA5FB4TmOeFuSKxuo1VQ5vfS
	ciRb9NDGuSUBGpXUndp0o1Ovbl9FxELFCWtI=
X-Received: by 2002:a17:902:ecc4:b0:2aa:e3c7:6048 with SMTP id d9443c01a7336-2b0cdc4357dmr31891845ad.23.1774624832328;
        Fri, 27 Mar 2026 08:20:32 -0700 (PDT)
X-Received: by 2002:a17:902:ecc4:b0:2aa:e3c7:6048 with SMTP id d9443c01a7336-2b0cdc4357dmr31891535ad.23.1774624831727;
        Fri, 27 Mar 2026 08:20:31 -0700 (PDT)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0bc8fac97sm60839905ad.71.2026.03.27.08.20.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 08:20:31 -0700 (PDT)
Date: Fri, 27 Mar 2026 20:50:24 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org,
        Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH net-next v2 00/15] net: stmmac: qcom-ethqos: more cleanups
Message-ID: <acagOODP2QD2xJf6@oss.qualcomm.com>
References: <acZDEg9wdjhBTHlL@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <acZDEg9wdjhBTHlL@shell.armlinux.org.uk>
X-Authority-Analysis: v=2.4 cv=QZVrf8bv c=1 sm=1 tr=0 ts=69c6a041 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=j9A04r5R_e2Fnr00k4AA:9 a=CjuIK1q_8ugA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: BwPeD1JzZKIBvv_rN6kgRc3bMJdYVzEs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDEwNiBTYWx0ZWRfX6yJkpuEUT1hd
 D6cXDO7/KZQpJOY4IY/S8/bQ+g9jxk29TWtU+xXTsOZsiwNJ54Om5DBjaOrnXAFXHjFp9E0ZlPR
 pAXGjUSmt9Q/Y6LZk2YJpZjeYobsAn1BwKjqH2jkJ3bIvUcR0ygarDYWVQuApv76TN4ror2PkFL
 QP93h4VZZ/AML3zzCP3H1VeIUiIiDiDb2B0qkNYmRYKz7CrWebvIjtxGq28ChFfINUHgpC26iH1
 yjI7UzuXicr+FZru55aIOZFVctTTt734fYXxiSYndII/hNKlqqkvZsH/eRF3PHbwvb//0sr5CtG
 RIlH8s/pQVWSR0+U91Dti83BKZUkfzNEkOR9GmMxpXS3plv97ulSnJ0sei1BIWBH5s8GtyCVleX
 wPUvaVH0aZ8gAUnEa7X23bbxE3zUwUPNUaj5U7bX0NyPWY8g7BEFR8eIC7GwT5kHsmxg0CGn+9j
 pgR0K3fcU9ctrLlyOFQ==
X-Proofpoint-GUID: BwPeD1JzZKIBvv_rN6kgRc3bMJdYVzEs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 clxscore=1015 spamscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603270106
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_082034_315493_14939A79 
X-CRM114-Status: GOOD (  18.30  )
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

Hi Russell,
On Fri, Mar 27, 2026 at 08:42:58AM +0000, Russell King (Oracle) wrote:
> Further cleanups to qcom-ethqos, mainly concentrating on the RGMII
> code, making it clearer what the differences are for each speed, thus
> making the code more readable.
> 
> I'm still not really happy with this. The speed specific configuration
> remains split between ethqos_fix_mac_speed_rgmii() and
> ethqos_rgmii_macro_init(), where the latter is only ever called from
> the former. So, I think further work is needed here - maybe it needs
> restructuring into the various componenet parts of the RGMII block?
> 
> v2:
> - patch 2: fix typo in commit message
> - patch 3: fix ethqos_fix_mac_speed() comment
> 
>  .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 220 ++++++++-------------
>  1 file changed, 87 insertions(+), 133 deletions(-)
> 

No issues found at 100M and 1G on the QCS615 Ride board with the KSZ9031
RGMII PHY. As noted earlier, Ethernet support for this board is not yet
upstream, but I have some local changes to make it work.

10M could not be tested due to limitations of the link partner. But with
100M working fine, I am fairly certain that this series will not
introduce any new issues at 10M.

Please feel free to add my:

Tested-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>

	Ayaan

