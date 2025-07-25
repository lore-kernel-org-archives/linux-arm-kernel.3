Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A33DC87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Jul 2025 23:51:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qXBSNgzMClCengYCrY3ivBRGUf8cHDHLLWL7h/aBi7U=; b=0DA+td8aE2eCJRjSsaI5ibAZjx
	VeThugGF2+/IKQ1OTeFduVtA3bPCJc/Nt8dVNM8UXZ9FqGqUnEIJbHh+3Zy2K81O+L23PLyMoYESU
	RMsCecy2UG9Y0BQiZpuzZGEumVu97tKcNDc6FE/emzwcALdpXI6/rFxxwEzccJK3Xm53ByVyLKhll
	3GnddJTE+fmUOYwBipCrLbPkbJO1TIk7I/2RnMc2o+MGqXqg+TbyRXn9itfg4PSNmsWRkVEdn73pR
	IYrwCRn/jWMGd99O7ZosG7km+9J9XWx+vJ1oZdp/cb5uI3FDrNHYcIx+oU6QIOqNapVIcalRslXZQ
	XdmfMFcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufSC6-0000000Au2b-1BJZ;
	Fri, 25 Jul 2025 23:51:18 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufS7m-0000000AtVV-3w7r
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Jul 2025 23:46:52 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56PL14w5000696
	for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Jul 2025 23:46:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=qXBSNgzMClCengYCrY3ivBRG
	Uf8cHDHLLWL7h/aBi7U=; b=Hu5O37cKi+LOw4ou7TZht2o5Iti4N/xAEKBfdnri
	rPJ0pSuvxhfWnZzJhgd8+BsqVUCmPp5FIo4HkakQ7uvvVy8QgTc3NC2eDCGbfTkT
	OL2YhsX6sVT7pnuMTNIHT/qzvk5+vZCvWWeCiINhxYPOXHbFcplIT7T+wO9hRQG5
	GfCHWtfw6H/EMYm7ZDrOiWaLut5DhotLT/hiHUO0h153pKmRzvP/Otr/h6uIWNdS
	PPhUVTR4m9tlJPXCkv8+9x6fyyaL6ut1w7yKuN2byo/itXCPNxVK1fRfi+jkcPUC
	1pc/lZRdOcyfLERglKA3u2n5TpXCOAIw7VpHy9uVC2vnPA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48489720j2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Jul 2025 23:46:49 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ab401e333bso77544311cf.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Jul 2025 16:46:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753487209; x=1754092009;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qXBSNgzMClCengYCrY3ivBRGUf8cHDHLLWL7h/aBi7U=;
        b=LG2nJTDPmtGmejUOXz+zbq06mmPjtTQ2n0pMv/RWWvJJIIEJb39PntBrBPeO292jm9
         lO6xth0dHsk10VuejyKkLDPBHguD2odUIuU69GA9cCd8mTJPfCsIDNi0ZQAj6niyh8ex
         GmWniC+0Tmob4Fii5TLC9MUbRfmw86UZb2ncXprNhR+AseB5s8xvrHrC3o9r7NRrHeTL
         BKu1/87Gg840t7YZDANguz4gW90xZ70qdN5y9nRDibKbrTv6HCylQAVkG7W0rmAwtBzK
         yIl6Ap4kOaFeDkUmJHt9MTaGiHJ+1cJlwYz3n95EYpfYpqJWGYsky1fb2TJqrPpcfvOj
         1BNg==
X-Forwarded-Encrypted: i=1; AJvYcCWy0apJpvcaSFGa0G9oPQxKt3s7MYcN+E3ZhCNckP7unTtYRPAarMYmQy/nBKynh+TqZxBIOfMoBzEUKumU8AMk@lists.infradead.org
X-Gm-Message-State: AOJu0YzBpj9IklMGC/kJXO/0BKJuurYtriLyxJH5hDbKHwyFXn0xXy2E
	+IbjddonwuHVZN5UEHWXru5TU/V7XkI0bn2aPPYbMOdIvqC3RRD5LGdIh0qoQZItVG8bUPmZ3p4
	DrtVCF5dh3FrR3mM/J/VaBLf7FKfv23lZ6eCPpf2tEQQX4E7ZwEU18ri7tVkv4nPn5amsil9JkR
	kMWA==
X-Gm-Gg: ASbGncsN9aG7PyIYhzgnzIUL1/rpuG18OSXYZesEdyMBPGerlxNghKW90pjmGQalk6+
	ic36dkL8rDpSePRlWl5g+zq0vTOIarWJa1wtehTyD5liqeuAiUIhijLRhx+yn2htsdrDbJ4FmK2
	neZQiXyXw4ThVS3FCbbqE9vRt8E5jjIUXG0jkNnwNVPfo8NMLcnu3QRy1OJ+cfbttyfgmIw1pSe
	nDaKjUja3wXohsHs9Hp+2yoEPcGRjvc8IdEQB5WmxBXHk7dUlFQimq/TAuzInIYf7qqxekcFSJK
	4XBkWDFSX/qb+w5tGPQjSNSyPBaB3AR8spBrHBwPM2mFjc5ZC7Vaks+HXUKfu3Eh+CoqvI2xjqL
	ievUMNGH81iSVoOjyHfR8dp1chqlcKihns1IS2Cei4M4+JwK0uDbx
X-Received: by 2002:ad4:5963:0:b0:702:d60b:c048 with SMTP id 6a1803df08f44-7071ff0f2cbmr58647236d6.19.1753487209107;
        Fri, 25 Jul 2025 16:46:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFy1NIdFUiy+LkfIlb0Nij2OXe6qkzDF3xYJLssxlfhKaFVl8cSqppGR61z2kIummysPqIbXA==
X-Received: by 2002:ad4:5963:0:b0:702:d60b:c048 with SMTP id 6a1803df08f44-7071ff0f2cbmr58646876d6.19.1753487208652;
        Fri, 25 Jul 2025 16:46:48 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-331f40b5323sm2034501fa.37.2025.07.25.16.46.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jul 2025 16:46:46 -0700 (PDT)
Date: Sat, 26 Jul 2025 02:46:43 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Andy Yan <andyshrk@163.com>
Cc: heiko@sntech.de, hjc@rock-chips.com, mripard@kernel.org, naoki@radxa.com,
        stephen@radxa.com, cristian.ciocaltea@collabora.com,
        neil.armstrong@linaro.org, Laurent.pinchart@ideasonboard.com,
        yubing.zhang@rock-chips.com, krzk+dt@kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-rockchip@lists.infradead.org, robh@kernel.org,
        sebastian.reichel@collabora.com, Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH v5 10/10] arm64: dts: rockchip: Enable DP2HDMI for ROCK 5
 ITX
Message-ID: <vncck2eqkvfr7tbnuffopc5pysdct3az744lnc4xesyublfwyr@jz3hyvz3kg7g>
References: <20250716100440.816351-1-andyshrk@163.com>
 <20250716100440.816351-11-andyshrk@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250716100440.816351-11-andyshrk@163.com>
X-Proofpoint-GUID: yhP7UwjhLKK1SqlIh9XBzZsAJ26xs9el
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI1MDIwNCBTYWx0ZWRfX6LPrl/JkW0cK
 pv/dhfIJp2O/R9QUKFcNh6Eerby+8AaXqJGDbwLH2yCGbLE+wB8UQDLFR/uJzoT5EN7R3OLpfaQ
 PSz4/jzr+hpWXq7QZ1cqaN8hzZ1mV4RdguS2WA1C8ecfYRUwZOmFulTAhRh1ozHQ+Du1A8Ks3ao
 n34lh4NaWC1MWnsJAFPPMab28QgX9dISlk0LmuPe4EDUbie2100VA4Fp5Sj2HWm72nhI9XI/ZiZ
 lp3HDiVcyADdRI3OiFydnRU1/3uBxbX7uYDumqHBOul7pSxXPr4giww/l5Cu4/xN53tu0D3PTFU
 sl/oWrgjCqEEi7IhNjqMb5KOaVXN39/DlLP0K/oskvi269WImFgsOo7FsT936ul/NhzqvqllZ1T
 MuImNbErTllHAfYRQRosxqe6g2/NmjwQnZYF9gMAdjoCwjgrqQ+7uqwuFbej1hoZh+5/43Sw
X-Authority-Analysis: v=2.4 cv=VJjdn8PX c=1 sm=1 tr=0 ts=68841769 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=s8YR1HE3AAAA:8 a=EUspDBNiAAAA:8 a=mMkY4CccI6nGLkDSWykA:9
 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-ORIG-GUID: yhP7UwjhLKK1SqlIh9XBzZsAJ26xs9el
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-25_06,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 malwarescore=0 adultscore=0 mlxscore=0
 bulkscore=0 phishscore=0 mlxlogscore=750 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507250204
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250725_164651_095672_0B40E020 
X-CRM114-Status: GOOD (  15.48  )
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

On Wed, Jul 16, 2025 at 06:04:37PM +0800, Andy Yan wrote:
> From: Andy Yan <andy.yan@rock-chips.com>
> 
> The HDMI0(Port next to Headphone Jack) is drived by DP1 on rk3588
> via RA620(a dp2hdmi converter).
> 
> Add related dt nodes to enable it.
> 
> Note: ROCKCHIP_VOP2_EP_DP1 is defined as 11 in dt-binding header,
> but it will trigger a dtc warning like "graph node unit address
> error, expected "b"" if we use it directly after endpoint, so we
> use "b" instead here.
> 
> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
> 
> ---
> 
> (no changes since v3)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

