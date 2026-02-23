Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8338BE98E11
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 09:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pMJwRoenSFg2hWtcaGyYH8c91ypYkTPXJQa7dQ0lvIo=; b=EoMKxSbGphVYdPP+k5eQ1CjoYE
	N1TDH6CPOGgk6JSPfkjrArQe6b1+Qnma5feTdginVWJyQm8mG2GF9+Q+dWH8IPecSC44ylI3EOeZw
	ZqTt4sJBrZqtS6TwYM7bh1CvPgVEe3DVpuLsN0qevbn7HPeaKLLVJfBxNQH26GtFL+pS16jycoY81
	9rvmpcWMgYEHk0qLOxQv9kLeUdwrcuVw2bkhbJKETd+rocYG2l3WiQJr3M6nURQpd3sQsdA3oVX/z
	YYI4Z4ioMvkPLJ548373EIIetFSDaaUWJJaA1OPhMBwT9uT9YjN+cGCT8o2vfUpyl8nLMXSh+UESr
	vYJkP6OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuSe3-0000000HaYV-3aDs;
	Mon, 23 Feb 2026 09:54:27 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuSe0-0000000HaXV-3xGx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 09:54:26 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61N9gvKg2278927
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 09:54:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=pMJwRoenSFg2hWtcaGyYH8c9
	1ypYkTPXJQa7dQ0lvIo=; b=BDEBQYHNvvIodIsKxbVwYcsC/q55fMTVS8gWXSn1
	MvlVMX+3JOBrmIW2f0FYtqQF0zbS7d3tCBxxVzCURPXuzIIfBLsqHHP/YLgnjWi9
	OiZUT+7M00nUxbDFIWgxX/bOW8X7GQ3tk0EX62ZL2++o7vr12d05QZszV+TiDlLa
	PC/IELJi2W/iuEr3GvdymOFzrOSReh8b/OMzDkuIxfVQuRGAElNfz0FcMahEgEtp
	9hnnBQ59d9E9TY+up3xVynDcHVGEoGVevKt3NxQ10pBbWXL52sJYSBwqsdDM4Sl0
	RWr/t+bjK7Pr7g+CfHSUjWoTcVaROPZPUNPWBjGJrd3SLQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5v3v6r4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 09:54:23 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-35620e2faf0so3363221a91.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 01:54:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771840462; x=1772445262; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pMJwRoenSFg2hWtcaGyYH8c91ypYkTPXJQa7dQ0lvIo=;
        b=Mt/QCpeeoiVjNEhL/ALn2Pt23ZAA8NrUjv/iYm/FT9vKWWBMFYL6es8cmZFhhQrYQ/
         DmJBDMuBtp/n2didilLSO0Wqur7SH8Xt9CEfNvWZV8qPz3kBTX/3Pxu027MieEKg37eP
         o1NpOhAVCaY4ljzsH6Vv1Rgihfqaa2FYVHyeK+lf3a0xUD6T8MPdzemPRc4xli5xiu0X
         +Q/Qa3WGLkHiFWArIgRTl5A8MhoLaFHNy1TLQCia4y7O533iqZj5cesvwN/QmKCWbXD6
         u5gCoalcUlGK4FKip7Rbj2d+m7Kz3bsCFB8YWP4foTtnGz2690fMchjeRxf6ZekUYc2M
         XTwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771840462; x=1772445262;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pMJwRoenSFg2hWtcaGyYH8c91ypYkTPXJQa7dQ0lvIo=;
        b=JaJ4jg6j+3WomH5tXPVg+lwMx+zBrtYphxxaCxzi0D5B1qG1ZhWhVKmiK1Di/kxMAe
         mixphbdhvgeMAW1iG1E8w9o7MF45+ixFkc100kOjbSNX7uzoEG0rzSdAsfFlL9La6h6s
         QgsTH7OKP4KVabwCkfM44T+pRwbPOGLDz8sZ3sqc05ArGVAUacd2W5sTqacndZI56O2u
         f+9K5OpNuqJwTBzMw8rWALO37y+Ru8nNDDvuwLnDoFiiCa+LlIeTmicdELM0UapbYkf4
         YM0PidyvUaADCQ6/PtcgESeXNqehkUeqxK0YO6sFK4/U+Nqd3PGmr3Iv24HnJS8zX/lJ
         g1gQ==
X-Forwarded-Encrypted: i=1; AJvYcCU21h5uITm3cmc41JgUJ5ekYibPC5EM9WzXzE2v2fTEsCfaFasuRLUAR1wKJEEnvIADj6sMO6TmsCOr7puMzK1X@lists.infradead.org
X-Gm-Message-State: AOJu0YxNH+Ax3m0Rhy/SxrCJBBt8mI7R4iQ2t8TpBM08SMp8W0Z/WATc
	wqLHc2eeWjgBJoqX/eB5SKyKPrjZEMOjmDBSll5YrkT7fB6w0U3VDCC2zLWIVb/bNFeKCO05W96
	8Nk2g2VniYyrzpxVYSzcOxH95OPaC/1E0s3U98oFgY8vlFiUhSLNQrGOtzKIqT911DojOdbhAHL
	rv2Q==
X-Gm-Gg: ATEYQzybfOBUDQWO7xOTOjSmWqnG9/J8V2RKjm+7MiQzSPG2DnwkRTpJ6DDP1klL8gp
	3Gp+jFGjvnEBruwseNTcd2iwJfaxZ70xAGPbidcD3x0l8ws37ZTUT9kZNMKcK+3EBqmFcfow1XT
	pqbVnSFOfBGXgGPBJ0S35EiC/i/F8gIQgstL8gKRaAvde0M3p1QX/F2+KAabqHAbzuGsztVeYAA
	HiUy1ZJtT/3X9aZUM+i+A8bgQH6abHVJEqQFaiMJOIIKGdNHTTpTYrzTwjWV/amFaM8ZJUgR0X2
	QKzCavS6BSBo3OWQstGkqSW8XFTCWEkYGftAj2vmWybu/CfkQN7dmJw8fBWydhv46nH1a/pI9Qe
	FTAhppfUwKPPSLA9VvKUS2QZtADbsXiYGnAc=
X-Received: by 2002:a17:90b:48ce:b0:340:ec6f:5ac5 with SMTP id 98e67ed59e1d1-358ae7c3134mr5861399a91.2.1771840462343;
        Mon, 23 Feb 2026 01:54:22 -0800 (PST)
X-Received: by 2002:a17:90b:48ce:b0:340:ec6f:5ac5 with SMTP id 98e67ed59e1d1-358ae7c3134mr5861383a91.2.1771840461811;
        Mon, 23 Feb 2026 01:54:21 -0800 (PST)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-358af93b9d1sm6128924a91.15.2026.02.23.01.54.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 01:54:21 -0800 (PST)
Date: Mon, 23 Feb 2026 15:24:15 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com,
        Neil Armstrong <neil.armstrong@linaro.org>, netdev@vger.kernel.org,
        Paolo Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH RFC net-next+ 9/9] net: stmmac: qcom-ethqos: remove
 phy_set_mode_ext() after phy_power_on()
Message-ID: <aZwjx9pKFROhF5DN@oss.qualcomm.com>
References: <aZcGxDBwfMXHbo_O@shell.armlinux.org.uk>
 <E1vt3Us-0000000A5ei-04Bg@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1vt3Us-0000000A5ei-04Bg@rmk-PC.armlinux.org.uk>
X-Authority-Analysis: v=2.4 cv=YL6SCBGx c=1 sm=1 tr=0 ts=699c23cf cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=PHq6YzTAAAAA:8 a=EUspDBNiAAAA:8 a=_j33rwhWCIcg66mWb4UA:9 a=CjuIK1q_8ugA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=ZKzU8r6zoKMcqsNulkmm:22
X-Proofpoint-ORIG-GUID: O0goSCWeGDLa2gYeqgwZG7ouPqIC26nI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA4NCBTYWx0ZWRfX3hgkNxDfBhp3
 GPIMfpSehXcazMilvLURcgdF1dUQww84ljiEL9FyJY0ypKi3pnMSAQUCIqB2j7+ixicaVl6V0A/
 lFz3Wh0aZ23q2PUNfsMgPQFo6pnz2VlxibK//NURo+ZQa62NbcOQrvQ8HB6DMP0Z7o01k0g+w1k
 kXAczFCNWCS/GV7Yze+mgqSW/BOE0nMr5oYtV5BMG0PNgvmlCwFIBmNBYGFmmN1jDYQUYwbUlJV
 rXKNzPNY4XK9l6eB2e84lJi0AovcMb6jlgXONGKNgGdOpgruW0WYY/V2vUNOLB0OYl2HEm3C2m6
 fKZE2Z8cE68DLeMa1HIsRwioWNJ0AlJwccCBe0Yek0vdE/hmKinIVBvCIf2rRkPJZuMBr0y3JGR
 NfYzCFYB5iP0dR8IhgQrd5q8Btxsq9MxWezrKre5O/gH8d1MJ4H9lhNYd6uaCpa8IwUJe0vTX+4
 JJwdNlls6RvoxUxnTmA==
X-Proofpoint-GUID: O0goSCWeGDLa2gYeqgwZG7ouPqIC26nI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_02,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0
 impostorscore=0 suspectscore=0 clxscore=1015 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230084
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_015425_094560_CD4011EE 
X-CRM114-Status: GOOD (  22.66  )
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

On Thu, Feb 19, 2026 at 12:51:10PM +0000, Russell King (Oracle) wrote:
> The call to phy_set_mode_ext() after phy_power_on() was a work-around
> for the qcom-sgmii-eth SerDes driver that only re-enabled its clocks on
> phy_power_on() but did not configure the PHY. Now that the SerDes driver
> fully configures the SerDes at phy_power_on(), there is no need to call
> phy_set_mode_ext() immediately afterwards.
> 
> This also means we no longer need to record the previous operating mode
> of the driver - this is up to the SerDes driver. In any case, the only
> thing that we care about is the SerDes provides the necessary clocks to
> the stmmac core to allow it to reset at this point. The actual mode is
> irrelevant at this point as the correct mode will be configured in
> ethqos_mac_finish_serdes() just before the network device is brought
> online.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>  .../stmicro/stmmac/dwmac-qcom-ethqos.c         | 18 ++----------------
>  1 file changed, 2 insertions(+), 16 deletions(-)
> 

Reviewed-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>

	Ayaan

