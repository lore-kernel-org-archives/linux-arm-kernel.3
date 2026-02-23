Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4751E98E11
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 09:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rkJsbjgrPmHKuVtyeITCWuo6Qs6gxTemZ0gXWydw0S4=; b=yKLfcH2m3I19YS8oPB+8K+id0E
	kCnhGr37QQSlaKbX1Cinjl02ahdQIWuG5xvCNjIqlIsenYWQIuG0bMirM3a76k6H4zfX4kMeUp9yq
	QcJFQxhs7qF35jNvN1Tl8cgRPadK42+rAQZ9hJDuUopFe1UrsfdMDyUAzPL/MuIsoLiuNPmNh4es2
	YhaRPOnN847yJ2VzMrRyq93nLxOaKi8AAvID8UiwsJso9EGv9rLC7scL+EJbL4xLF/5deDuiGsJ5b
	xBPj5tm/4oLCHZtqKp6PuUVufDo+xWwYDMj61DRZLkh1y/byqhOru1YPAN/Tlje64e5YsBUQXBefj
	ScmadEww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuSZj-0000000HZjr-0jQx;
	Mon, 23 Feb 2026 09:49:59 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuSZf-0000000HZiN-311P
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 09:49:57 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61N9WILn2816475
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 09:49:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=rkJsbjgrPmHKuVtyeITCWuo6
	Qs6gxTemZ0gXWydw0S4=; b=MCroSxMvREUglMMehsXfDVNamKc0VZ2SKpcGWJ0E
	KtIeAX+q39tjNd4AxG8zfLt9aSVvhKXjUMeriw+of3z3bKy8KMHwJ5ONzmMkdZF+
	viYUPm3k+rHg4g3UnEFe1heRxC6sAMYwsdUp6JN7iEOZHXZBflhIaU7/Mb7MN3Ay
	IvnDpZz9UVH+J6N+9hv2fnsUKL6ELzl//e7qYElVE1Dxnn1GT+Nzv0Lg9JOzhAWz
	pVQv2fLokAUCp3WPaIIE0Ma6lnuxR1Ufrsarf0OKt4tWTu4br/A4fVert1QvQOsj
	4+8mcBHgYqY573DG4sdZVwiYgpG6xKVlWWGN43WC4PIJew==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5vj45xn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 09:49:53 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-824b42b8a81so18673405b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 01:49:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771840192; x=1772444992; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rkJsbjgrPmHKuVtyeITCWuo6Qs6gxTemZ0gXWydw0S4=;
        b=CGlADuEyPE73vFWSwWPbwifl6KGw307zFbwa6BQlfiePrzpIzY63CWcCnYoYbUi/PU
         SIo+6gwNMsMtLRA1Fw0OwLc914iC2P0UxTTcQbPtny6X2uXFV3yh8o/KCmx0by+lfaeW
         IBmvAcEEMgAVVCYRDF5Vb46u3d7sM68rtzmwtgbJ1P1MppEATCLfvbD8oscdm6AvOR50
         HXqgFxB9iU+rtTbW9+SubKyxmHJ/pg3hFSqp6WjTr7AwH1uRiDZzU7AFBUjnSX1a6PFR
         Z606yPdKRb/7+DZx4Pdgg1KRBqigO6yCR+7aDykKKYSVX5U9zwhe33bf+2HUmtAJOcCk
         jM2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771840192; x=1772444992;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rkJsbjgrPmHKuVtyeITCWuo6Qs6gxTemZ0gXWydw0S4=;
        b=FrMt4s8Ogud0V/wEEO8K2yEP5MCVvJl5FRsS8oXqehbWr8BObyxr2tDf6Exaja1ALD
         lnssrOB89b7S60ZdB4WXM06Zts2L8Z9gKAGSUxh8kufTPZ9bGcoKviwmmEod1y0mLBN3
         9zCRsWW50qWzjuzAnsrXzh5K+HkSS4NkkXFKMeeNqYQQGFagIEG/US7sVkaRWoJ0EbIc
         aGAwihTyWca7hXLvtAIy9HZ7hgxGkOcBXZYLwFZNy+VNfd28Qz7bgfQD+mL7eep9Q8z2
         /8C3RKeCL2sBu4uapxrfQw8A3ng7MxRK+FjZCakvK5j0qxWSlgPiqEh6YkMghHEPFStK
         fYlg==
X-Forwarded-Encrypted: i=1; AJvYcCUuB2U/OzcmyptcKvlzJeGqU1YL6ZjNXTlRzRtdF4bkxy7RCJHl51Vx+pf8G3XNS9xvthdwFT2Wa484dJ7vwZ4K@lists.infradead.org
X-Gm-Message-State: AOJu0Yysl5ajIkuA3weYJnsMCxK9wWd9NnF4bmwxsgKEgB/b0h4OCKi+
	nZ4fwrPuqE8AV7hAwc7fouaXhPszqpG463MXnABi1zku4uecjN21dt+fnf0c2FyGHa2BtKtRY6y
	AXH6/b9z/FTCma0aFvUMsgOfB14LKjb8NFaG2/J2fMaJYhQFVvNQYSmgwSIamlvPPb2Fpnu2x8k
	PCfw==
X-Gm-Gg: AZuq6aKFzdI2aCWsYZh6a1SX+Z0KCOPD8CAUN08IVUOod04PzQAEiSgKBGjQZF6xoCO
	R191Gzt6+cYDndlvarQg5ShlBzo7gxu/FT/CVpNOOZ32iVnnFfSqKQceq/G4UFzBxO8tr+ekdyg
	iH+mXcvWI/x1/6oA/zo16SkjBVI2kX3IPoULR4Aq+B/2vL8TLSu9iLmUWjDiIxvtOgfs4MyOPIz
	JsF2udndKtNP90pLNly209XfKWSFgLt7rPM+rlobUyRXjlzw636A0mRT+jsZj4Q74ws9Zze8Fyl
	qchxSgv4eBfEs5EWHXYS6Ek+UTPpTldP1veCBzYLogJ8pW53CWOq1+6xRo69zxqYHsuhUPWAVeJ
	kPPiNZLsfT0j7dxeRsf5sxVKj2ymDzzwPUY0=
X-Received: by 2002:a05:6a00:4b4f:b0:81f:52d9:5f5 with SMTP id d2e1a72fcca58-826da8bdbc3mr6321595b3a.10.1771840192213;
        Mon, 23 Feb 2026 01:49:52 -0800 (PST)
X-Received: by 2002:a05:6a00:4b4f:b0:81f:52d9:5f5 with SMTP id d2e1a72fcca58-826da8bdbc3mr6321581b3a.10.1771840191756;
        Mon, 23 Feb 2026 01:49:51 -0800 (PST)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-826dd8baa34sm7795039b3a.51.2026.02.23.01.49.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 01:49:51 -0800 (PST)
Date: Mon, 23 Feb 2026 15:19:45 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
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
Subject: Re: [PATCH RFC net-next+previous 0/9] net: stmmac: qcom-ethqos:
 further updates
Message-ID: <aZwiuVeEAcuEnP8F@oss.qualcomm.com>
References: <aZcGxDBwfMXHbo_O@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aZcGxDBwfMXHbo_O@shell.armlinux.org.uk>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA4NCBTYWx0ZWRfX0vPdt/PX1wtd
 DVvK/XDodtyEh/zhlVDHx9A3LDcBw8NONWPhSPsq3XTeb/v0szaYRGrczNhMxFl0uyK72DG8rn+
 b8uC4MsEuTObvOiDTQYyBQJsukOADOLyX0uJvXRHI5dJILKMeYUzWl09B8E8ZEkb+t+Ew2pk4oE
 FsjvpQq562SmGGJum8YfBRl6L0LhFq45LoLgtFDVFxYXq/CRrbfU/GQWUkdF10w2a88wlYX4tLb
 0JbQF2aMIn4E0omnh6FXZWS1hoOgVJPx3/7NdCo3/bYhddaWYEsu7JtPg/maRVuLY4mCQI3Tg0y
 KpNc/roB9KLcROE02JV7SYM+Vbo/Nzst39//eRCz0M6k5aVTR//mL5RrnB6JaDv+pv0AxchEM/l
 KQznDGdA00k6V+js8rFLfhxirQPIkXsCEQArsI9KKIEu85eNmYH6ntsqnw4rXDhQediZrgya9y4
 qXHQ+RKvGDx8keU/suQ==
X-Authority-Analysis: v=2.4 cv=T5KBjvKQ c=1 sm=1 tr=0 ts=699c22c1 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=PHq6YzTAAAAA:8 a=EUspDBNiAAAA:8 a=M31p6wNruv26cYMHQocA:9
 a=CjuIK1q_8ugA:10 a=2VI0MkxyNR6bbpdq8BZq:22 a=ZKzU8r6zoKMcqsNulkmm:22
X-Proofpoint-GUID: ZyL5aC0rsia3JRPlF18fcSNS7ZpoT6yV
X-Proofpoint-ORIG-GUID: ZyL5aC0rsia3JRPlF18fcSNS7ZpoT6yV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_01,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 phishscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230084
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_014955_949649_0B5BA2F2 
X-CRM114-Status: GOOD (  23.36  )
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

On Thu, Feb 19, 2026 at 12:49:08PM +0000, Russell King (Oracle) wrote:
> This is part 2 of the qcom-ethqos series, building on the previous
> series which can be found at
> https://lore.kernel.org/r/aY0aJppQWUC52OUq@shell.armlinux.org.uk
> 
> This part of the series focuses on the generic PHY driver, but these
> changes have dependencies on the ethernet driver, hence why
> it will need to go via net-next. Furthermore, subsequent changes
> depend on these patches.
> 
> The underlying ideas here are:
> 
> - get rid of the driver using phy_set_speed() with SPEED_1000 and
>   SPEED_2500 which makes no sense for an ethernet SerDes due to the
>   PCS 8B10B data encoding, which inflates the data rate at the SerDes
>   compared to the MAC.
> - allow phy_power_on() / phy_set_mode*() to be called in any order.
> 
> I've included the set_clk_tx_rate() patch as that was tested, which
> would make applying this series awkward to apply without it.
> 
> Mohd, please could you test this series - I'm hoping it will pass with
> flying colours as there should be no change to the order in which we
> program the hardware. Thanks.
> 
>  .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 52 +++++++-----------
>  drivers/phy/qualcomm/phy-qcom-sgmii-eth.c          | 62 +++++++++++++++++-----
>  2 files changed, 68 insertions(+), 46 deletions(-)
> 

After changing phy_set_mode() to phy_set_mode_ext() in
dwmac-qcom-ethqos.c, no issues found on:

  - QCS9100 Ride R3 (AQR115C PHY, 2500BASE-X) - 2.5G/1G/100M
  - IQ9 EVK (QCA8081 PHY, 2500BASE-X) - 2.5G

Tested-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>

	Ayaan


