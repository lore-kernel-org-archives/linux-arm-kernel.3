Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8213DEC1E92
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Feb 2026 10:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7XgVQgH5FytF8RnzcwtnZGEmtheQcG/boixIGeEwwMg=; b=QHG5hxbCDTehdBEeXBcxQqXq9u
	lnEcjgaMT/QkUriLvXuWxTphlpJsA41ZcH7OtdGRvfLys/xMQeWUfTnRkT1lrf4hRzSPY/H0g6beR
	CuZCNUqcmctY5Y0oSv9nDHbBtShBTpkgRcVm0p055HEkGvbx9wmUjBryAMT+cZcMBCsoEtUdjFHWp
	wWtm70mD/POCwGC25tsEsV6RZ9utkRWhbqRRWe7NA6+IRXSH4M2YgEjR1G8rS1aF48pmWz1kGPWFW
	AJb7tAKNR77X5tp3/neLVQsLuZfE46oletKaGgGqB5OMFRyT5dRX36jV6g3UBZ6k8LL+mLnt5tm+B
	FUPfg91Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnwbn-00000009mME-2KaU;
	Thu, 05 Feb 2026 10:29:11 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnwbk-00000009mLh-3O7V
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Feb 2026 10:29:10 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6155q6FV4165727
	for <linux-arm-kernel@lists.infradead.org>; Thu, 5 Feb 2026 10:29:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7XgVQgH5FytF8RnzcwtnZGEm
	theQcG/boixIGeEwwMg=; b=IqoVJ+Ywp1NwX67gZQldLM2edKO+gK63/kiAldlL
	yGRfOw4bXyMBlR7nfp4Nv3ppUMZiDDEFk8dIMMbx66nZKrB935FoEXUoJ2w+D3/s
	BcLDC0BUTr8eOTMuXUmgDaHdyQyt78M0XwEA+DYEZfade/mPb1jmCZj8RHGqx9vj
	mu9XQkL3IEKvNg1f7dMCkkhN8WysFv8UltSG87KBCzFTTd4dB628tBEAVtViozzx
	BqjoTLX+bI3MyfXLhl7R6LH0PzXKQPQFPEJ0G8p+KfWnPOc3wNJetjAZ+pcol36t
	E6nQE9rnSbPPNx6UFWvhopekG88Jt62+mCTdo8q64NFVsQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c4neg8u0h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Feb 2026 10:29:07 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c68b97c0adeso578532a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Feb 2026 02:29:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770287346; x=1770892146; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7XgVQgH5FytF8RnzcwtnZGEmtheQcG/boixIGeEwwMg=;
        b=X474BC6DEO6aUuBOYA7dbrGS1N23Ku8cp6Ftnx987Abd0xM00H3KQW7YhzvXMOqbvL
         V4Jyug3GkaPEktTXYMt1KmqUNHqX9ADveLYfLo4BIuykXNAnTN+cp0yT8nKTR+8JN5/N
         Zzn8by4ShRuBjvSkYlAMnMhdLIxllyEK2mJXBTdM/JIGLoND/YzYmtPYiPvPgIjrFkYT
         E4TN+dRzCrm5oUHT6IFjuNsj6gg0+mYNCTm/iANOzSumiU4czoFFuMwN6rzN1SrGGoX/
         3TM1lOHsLIY/v7Zh4RoRfgjhhdlLNoPEI/CyJUDzKcwO0/77UL+hBwEIn+N2navxLhYi
         FGXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770287346; x=1770892146;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7XgVQgH5FytF8RnzcwtnZGEmtheQcG/boixIGeEwwMg=;
        b=TQ3MCSRuCUfUVYPZnIgjK7GU4KojOtpCLBqH64mrN1vhzVOtxpvZ9yz8eF/NnwciIQ
         Hb7PP8J94oclnRLLQDY+lqLS3ShtAnF0A8SaNrg/PnqeVenhf1G536upR2IjKc6jy/HO
         ML1h7q0eE+h9ACzZxPxVyoWJ+ryMEnJ1VwRy4Z71xyBJ+WYchVS6R6oExVOGIJL/Y2WK
         mw9nZ2M+mrXRgUOCTCbGitOo4XTHMSfAtsf2pe+4UjryUHjm/aSHcmw4XkjNzSk/9q8J
         6czF/c3h0dU8PnaxQEi7vxgr+0ZFc2oXy65TSkFjySqyHxI8+jwm3zpFT9vRvYlU3fJ3
         JjvQ==
X-Forwarded-Encrypted: i=1; AJvYcCVasSBluhEDGKJufdJ+Rl3a85uaNmBb3rAPMvztFiTR8f32V5vtLrPAg6FEUGcPUeoqhHVA8Hj82A/XQ4d4L6TF@lists.infradead.org
X-Gm-Message-State: AOJu0YxdDvVsYy0LUvr/UXSx67gl3mTfjgIoWNDW1pDpK1bgDB+SJcSw
	E6fJKCb7P8WaLBJcGo4MAlWYDnevIVklKa+//clKjaGRI96ZLqU12RVYCxsffJJgFYUvNYN14Ig
	Ctyci8KVqxjNgqStoAi9H4LTl3z0QvKfhk4l38YXDtYy1ly2AbmTI7pFoVKYkKnE+dmKvQ6Ouyi
	TfMQ==
X-Gm-Gg: AZuq6aJkGUFzBj5WVwvb4l0NMVxrsr+YtcoJostXjWw2VzbW+PKlUai4ISZVieAOr83
	/n0j8ksAdKjxB4RwPfknIpXncsBbjMmNbh0KWskdHBqvW6gmn88Frxspdd2pUAs1hDhwEkeplr4
	WySwyt2Da2GTeubB9IgU/KBYdJ/podDZ9cI2zpC6nw9mcHn+BzQAckX2R5lP70Ngqwny45FL+na
	d2zQ3wX5Ozy3HeWyPrauFSo3RX77sjhI6TnwhWa171Im0XE/Rc8w96ynIcLqJjivMVMnh9XaXEE
	LYb9FNTPZESZtcZkjDCqYphRX9ZIknpymkGLFKPRtKg1V4WGvHRzVlcRNubqbapIbyU2TGVhQHF
	jFmp5RfSsxl6ZRnSnUXwfSbo=
X-Received: by 2002:a05:6a20:3d8a:b0:366:1917:54cb with SMTP id adf61e73a8af0-3939025841dmr2317137637.3.1770287346164;
        Thu, 05 Feb 2026 02:29:06 -0800 (PST)
X-Received: by 2002:a05:6a20:3d8a:b0:366:1917:54cb with SMTP id adf61e73a8af0-3939025841dmr2317105637.3.1770287345619;
        Thu, 05 Feb 2026 02:29:05 -0800 (PST)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3549c09df19sm2040354a91.1.2026.02.05.02.29.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 02:29:05 -0800 (PST)
Date: Thu, 5 Feb 2026 15:58:59 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org,
        Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH net-next 0/4] net: stmmac: fix serdes power methods
Message-ID: <aYRw6xSvEYmpWnSs@oss.qualcomm.com>
References: <aYHHWm5UkD1JVa7D@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aYHHWm5UkD1JVa7D@shell.armlinux.org.uk>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA1MDA3NiBTYWx0ZWRfX7O/tZdd+HaEM
 R46ahG4m+rIvdM3trqo6xacm6swVXotlyUnpdmzd5tLJf2D8NDB2+ga+T8tnwbiO4UQpp2hHIX7
 882Pr58MLwm2rmZc2krCHMiVtCX7Ddbbygbe4oLUL+Bolew6y2nt6Xu2MZWnv8edb2PZsZjAL20
 nj3oK42IJC5C2FzWN46R5pRpDS6nls+QZPPMKgXcr+iAjkObzXUK0Kg08zceLBZRVeWjByPTII7
 33y5TJA9xR1A64ydqk5HiHVH9SvUPbMcBg3Th56WGvmp7L7fmsWSi0NbJ+AOfQWWru83zHS+Tsh
 qj1qMpf9C7Ccc24OwLE2EgOpMbn8E0XylZMxRpeiF8Zm4YB6Xis/c+hDhMLTK8IZOxnHxFJgHiY
 S1X2XmxUYA7eDrrhlsEBnerRPW4IrcUrewwPnd1zH3k+5XTJqkslha08M55nnC1Z6Y/AnWLF5/g
 hpWWRy6643KyyrPmKxQ==
X-Authority-Analysis: v=2.4 cv=ZITaWH7b c=1 sm=1 tr=0 ts=698470f3 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=spYx4npwnBwiAfMOhkEA:9
 a=CjuIK1q_8ugA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: 7LtyUIr20bYghPT3fM5YOSjAuLczCb7W
X-Proofpoint-GUID: 7LtyUIr20bYghPT3fM5YOSjAuLczCb7W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-05_02,2026-02-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 malwarescore=0 phishscore=0 bulkscore=0
 impostorscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602050076
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260205_022908_982308_E0AEE002 
X-CRM114-Status: GOOD (  15.44  )
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

On Tue, Feb 03, 2026 at 10:00:58AM +0000, Russell King (Oracle) wrote:
> The stmmac serdes powerup/powerdown methods are not guaranteed to be
> called in a balancing fashion, but these are used to call the generic
> PHY subsystem's phy_power_up() and phy_power_down() methods which do
> require balanced calls.
> 
> This series addresses this by making the stmmac serdes methods balanced.
> 
>  drivers/net/ethernet/stmicro/stmmac/stmmac.h      |  1 +
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 65 ++++++++++++++---------
>  2 files changed, 41 insertions(+), 25 deletions(-)
> 

For this series:

Tested-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>

	Ayaan

