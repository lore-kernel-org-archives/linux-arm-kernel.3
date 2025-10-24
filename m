Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E419CCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Oct 2025 20:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4s7W/XVPsSKkxr5WrJxW2Xw4Bw8xDxZi15MzcSKlWvc=; b=iuA1SD0giWh/miC/puM8A7+E4i
	qZ+v7cYlRdXABnvD4qtBRX/THHINcAzdGih9m+YwtxyqdiiuNgiLzj1MsqxRuhJ/Ansc+VqeLt+aq
	THDeSyPViuc03aX7487M6W0L4NzjCa98VTZfCXG+yFm4Lt81l+S6t5bxFV4S1nqQEV6NT6QaGPtNV
	CVh35DZzkpuA8Ee4g7mSWEuKYz1fX6aam46sSBXf3ZZ3jFBtynv6vt2wHhhZRjYpacBF7+WAoCSWR
	GwuUfEbfUwmTVntEjh1t3sBOhE+hA7gYlL2Bhjz1AQUn8OgQPFUtVQGDAgS/v/LfcVcfRt0eywP0c
	lepjhuTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCOJV-0000000ASZQ-24P4;
	Fri, 24 Oct 2025 20:23:05 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCOJS-0000000ASYR-224o
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Oct 2025 20:23:03 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59OI9hhj021391
	for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Oct 2025 20:22:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=4s7W/XVPsSKkxr5WrJxW2Xw4
	Bw8xDxZi15MzcSKlWvc=; b=MNXOWZkHxfew87KzdGBbhYPJYIi7C6XUeZFoaZfB
	Wesyte6wCdRC1+JJN861xNyBScJHCelVlCSQhdRlx7CUZ2Y4Yb2agVz2I9Rn/KQa
	thu1dlrRi85b1VFoEUZfccfyR16Nm9ZyWQENXwykriaKvRatun7GUtncm7IP2y3V
	L/N/O9GsCeuxB841wgvkHme+sFfH3g57Wn2RrO6X1RPzU6J1dfBx3QlQyvZ+sW9C
	ZGXHUG3r7NLpTeafH9LyRuNFV2/NrMlEHEJDdggNG5EJuaMvT+X+IJJ02zjEYXr/
	M3FSM2ZSBXfAFAcMdMZlH0R6KeheAKDcYWR/3Tl5DOOh2g==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v08pwdqv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Oct 2025 20:22:59 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b6ce15aaa99so1930777a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Oct 2025 13:22:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761337378; x=1761942178;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4s7W/XVPsSKkxr5WrJxW2Xw4Bw8xDxZi15MzcSKlWvc=;
        b=RSIH8Eqsm6emxB89W2CTFszvpx+f7gPs7x/TSvQ1VMUKTZepmRJ7R/+Ux+vBvgoiLr
         g2grfsbUiQeQKNPKisV3WlPZntS3+z0UOxe+MpnL8HaWoCYOHt/rYFvMeVt6OA6OzwtM
         G4yX09Q8UfrytIh6cuQpNyqSW5LMRNrZ9i1QjuaEArPfCCqWwWAsEd25VnDBGQLAn2I+
         awYPcOvyext4BUh2/rphC66+mtKIPajgLwDR8Cyj6Cl3jbKyjlC0khl4w77VQbeS1dbv
         SIdF9lrXpAQRbssVW5vvhMQCEnW13Lh4xw1eA7O8v/y4+YjHLgYpIlTvkQzWBGhQsy17
         kmRA==
X-Forwarded-Encrypted: i=1; AJvYcCWbbrFOQJ5jLacEgnuD7BmJCHeiOK7/SGWW+6RJsnZ30SHmqK/crRyo98ddMXCrfv1zrxR5xut9wetxCao+Jy3v@lists.infradead.org
X-Gm-Message-State: AOJu0YwnGeLyoZEVXUc/pFxTAGd75OSzxMKAwAapwRdTJs5CGGVrLrPn
	jWM+hkF/Qu9eHSoBh5ZhawNLRRZI/V36gIxxYihOoAR/1TBe1cTfvDm2HNWzDVLiXjnj9NzdnWH
	rfgqIpFte7Yrhjp8QdSiJJpKE+rgAMNrD0CplnRugfauw8WtML6QE6Ll1ucJCXUnwYx/3i2UN/S
	6DWA==
X-Gm-Gg: ASbGncuY0orH8XvXLqbus+J9wooapf6nBzsFyCzMmdL/1IXeVIE/uAGv43d0XRWkzfy
	8LzeBn8GmDxZ4VFCwLWS4tElI34YxWd43pyBwyD3KLbu1bzARpz5rz5UbWdmok7KCLc5as+qUHa
	g9qIzt+92ndCILuKT5Yot2pXkUGOCExL3wEz1kWCsBADBTp56lVMIklXZPTlN/9Bnd1n3PbE8w0
	vnslvyM3z2TXTP1g7Plmors+7TrwdBgKtqK985ObAkF7xPyX6qZCwCCavkF4nBenYlyzSmLbnjM
	p9HdTnE+SILTVwmgUT9K4Af6uAog9kd/iszA3n/6xIotR8JWUgs+JV/G6RGpJkIeiyJN8q3BTQh
	hPWrrNX8jXxN7
X-Received: by 2002:a17:903:1250:b0:290:dd1f:3d60 with SMTP id d9443c01a7336-290dd1f3fc8mr257610765ad.51.1761337377908;
        Fri, 24 Oct 2025 13:22:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFbuyFiJ9PskI3CsAgB4hGF6Xk8h6QS2PPp/bDpzFnWGnwg7UfgJO6gCcviCKkunL4F1CUUrw==
X-Received: by 2002:a17:903:1250:b0:290:dd1f:3d60 with SMTP id d9443c01a7336-290dd1f3fc8mr257610465ad.51.1761337377287;
        Fri, 24 Oct 2025 13:22:57 -0700 (PDT)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498d23218sm897285ad.51.2025.10.24.13.22.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 13:22:56 -0700 (PDT)
Date: Sat, 25 Oct 2025 01:52:50 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
        Paolo Abeni <pabeni@redhat.com>,
        Richard Cochran <richardcochran@gmail.com>
Subject: Re: [PATCH net-next 0/8] net: stmmac: hwif.c cleanups
Message-ID: <aPvgGjHr3eR0088m@oss.qualcomm.com>
References: <aPt1l6ocBCg4YlyS@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aPt1l6ocBCg4YlyS@shell.armlinux.org.uk>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAwMCBTYWx0ZWRfX0SSmsEyZQoRF
 WvLsjEC5KHbOu/PsFWmQWXbAxAnwctoNCxohR9eziGIRevQUvPyejnMUQbFVBdRRXBYrfdsfGKN
 YcL7JNWaB1XhR5uPhQmO6UvxlvUjxcytTL325niflJQuoNWQtNtmVi3LqZHPak+DfmIfXHRW8NM
 X/1ZSjcKHYVQz48ver1teBW1ctnZpNSpJyL+gI+kU1ZolhXbYwJ8Y09lcGNbZZbNqm9rFKxCY0J
 FzVwGTm2orToL4MCdERIBCKpucxfqPW/JPnjxr/31qzkq08AZFWykUAcjz+GUl7xH+YU8tnGAHD
 FbDuQPm7UX2OOK+6piMGcDjTCgOp/bbrlG7UUbfJRWOK35jZEEM202lez4rUgHicTHPqrGdSr6r
 K3JwKT+VRL8KndhJA8kmZ+qrQyVxvg==
X-Proofpoint-GUID: AIMelV7okTW_oOQY5G2W4jcDgaS5aQoZ
X-Authority-Analysis: v=2.4 cv=Up1u9uwB c=1 sm=1 tr=0 ts=68fbe023 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=t3lSQCkMIvt0bwidl4oA:9 a=CjuIK1q_8ugA:10
 a=x9snwWr2DeNwDh03kgHS:22 a=HhbK4dLum7pmb74im6QT:22
X-Proofpoint-ORIG-GUID: AIMelV7okTW_oOQY5G2W4jcDgaS5aQoZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-24_04,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 impostorscore=0 bulkscore=0 priorityscore=1501 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_132302_643306_FB91E12D 
X-CRM114-Status: GOOD (  20.54  )
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

On Fri, Oct 24, 2025 at 01:48:23PM +0100, Russell King (Oracle) wrote:
> Hi,
> 
> This series cleans up hwif.c:
> 
> - move the reading of the version information out of stmmac_hwif_init()
>   into its own function, stmmac_get_version(), storing the result in a
>   new struct.
> 
> - simplify stmmac_get_version().
> 
> - read the version register once, passing it to stmmac_get_id() and
>   stmmac_get_dev_id().
> 
> - move stmmac_get_id() and stmmac_get_dev_id() into
>   stmmac_get_version()
> 
> - define version register fields and use FIELD_GET() to decode
> 
> - start tackling the big loop in stmmac_hwif_init() - provide a
>   function, stmmac_hwif_find(), which looks up the hwif entry, thus
>   making a much smaller loop, which improves readability of this code.
> 
> - change the use of '^' to '!=' when comparing the dev_id, which is
>   what is really meant here.
> 
> - reorganise the test after calling stmmac_hwif_init() so that we
>   handle the error case in the indented code, and the success case
>   with no indent, which is the classical arrangement.
> 
> ---
> v2:
> - fix "verison" typo, impacting patches 2, 3, and 4.
> - added reviewed-by / tested-bys
> 
>  drivers/net/ethernet/stmicro/stmmac/common.h |   3 +
>  drivers/net/ethernet/stmicro/stmmac/hwif.c   | 166 +++++++++++++++------------
>  2 files changed, 98 insertions(+), 71 deletions(-)
>  

Tested v2 on Qualcomm's QCS9100 Ride R3 board (qcom-ethqos driver,
GMAC4), so:

Tested-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>

	Ayaan

