Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EE84EA7193
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 19 Apr 2026 09:52:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XEo2oTEcsG7l3+0lO7xxDJBTjTSe7sGpcaQQHTUMBQ4=; b=inAKRzn2mTCNFZM5hz3wC297gO
	gm7eiGb8KHIAHKTKf7b06CnfcoZQlSx5Ct/vt0TWgDbJ/hnschN8zU7rZnzrRLbMtTBgqRQkX9+Ld
	E0zv9T2VAlZnNgZGGu9V5nKC6hx0YMMbarmNFEavc6118nj86EA7VN3je4HYh2Fx/Zu2IJ8lncAN8
	EafOtghsX1l/cUghzE7c9H2AxsJY/N0ENQBNYAWZs3wPIcgzJa55BTaY4VeTnABddAKEyXuzJ8qfN
	joXudKz9q/AR5Ox1J9esXsYh8pD4CmyrrJH3NUaxf+M3XigLaG1ZHY/GmDmNbrdzX7fI7L3bsf6YC
	Eaub1SHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEOpD-00000005gaj-2P7E;
	Sun, 19 Apr 2026 09:52:23 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEOpA-00000005gaL-40DD
	for linux-arm-kernel@lists.infradead.org;
	Sun, 19 Apr 2026 09:52:22 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63J2PVZZ967469
	for <linux-arm-kernel@lists.infradead.org>; Sun, 19 Apr 2026 09:52:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=XEo2oTEcsG7l3+0lO7xxDJBT
	jTSe7sGpcaQQHTUMBQ4=; b=al+xqVad34Y/bw7J9fDIIbwH24QaohImnwDm6pGa
	gx6jPzlcOjHPgGY0a9S84+nvdXyfkcizkgdraOpsrljazqANG/kOaPgStN9sXt+e
	EHrJphjGkh74TcCUIe7gVJ/s8CO2Tqkbe4EHDZjPTZznH6WSFrYAI+EJBCtmRhPj
	4xFnc7anee0zBmWvqhSE8/mYqRyidloYwxtWPbvoS5IdpIXFb3khqRjKYwMD/A04
	Ld+nEu41Ot/Qrmhh/4Cdi2Z6nGl43YaDAzUKiKtmg6H0hOdIozkChRF4BMohoOnY
	Xm0E0ZdY1aKIO1dQiFTPRR9xnFWouvPhLNduqQyEsCqqXw==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dm388j7ek-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 19 Apr 2026 09:52:18 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1273dfdaf5dso1700880c88.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 19 Apr 2026 02:52:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776592338; x=1777197138; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XEo2oTEcsG7l3+0lO7xxDJBTjTSe7sGpcaQQHTUMBQ4=;
        b=Hy1Y9347lEbwnwb2BcmumIbmlEsfxuwDSs45yvGjFafq8cbpjezTi8Tjb150uf4b2o
         n8Nafoyo1Mkj2vQZojJSORFBW96lK6nhRmEGvzbcj6jlseGZ6xTixatB7pY3EtqaMpz5
         BINqc+AIa3bfEajRIIQ5RO/zoizH66fH7zLU7uOzeNRftgGcw+KLnMWFZQQR+Fw7Xziw
         0w62ilyAjduZL1kCoaaPmH+Ai+BYwKQNpuGR5xiHIueEKF2w049IBKLbu4fkV71l38UW
         4cLajgHB7eclBYBEAt54OKvkVC/Fra5c3vOqdof4xi8qIbbf68RGjLlQ6BeyeWynlWFH
         Wxlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776592338; x=1777197138;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XEo2oTEcsG7l3+0lO7xxDJBTjTSe7sGpcaQQHTUMBQ4=;
        b=nf0NTGqh5K+OVW6zopyurOmzsRpb1Z+ZQRxOZiWyBJwwTD1O+CYE1dHpUqpPgKEEQU
         3eCFfZspLf300/KuSx5cpzcaJEgdeT4H/uFyIdRAhUWM9+AjMeV0bfKVeAtHCNavUAjn
         Wy7+N6xpmwzAaBTlIhuOOdOIqpfH6e+cgadREZW7hmbq130DO7ttJ5nSDbEUilfo6OMV
         R/Nkj9BoZZML2Jq6MFHdsk+ehd4OsXTg9i/K/r/fWOXgUa19Po5mrluv7svpNmgqVSNz
         GfqKYx7T4Bs6flg6MOv2jVIxQh7+oHbrIOI9Dhgjo3+y0tYw8/BP2QuC6fFi1LNmcqZa
         XRLg==
X-Forwarded-Encrypted: i=1; AFNElJ/tX5Qhlld2W8CdbmKymKrnWVb6G/Ks/v5dSN8lZfv4uoxWdtsriQG9FXz6rvS7n4PtFT75N1RhjyAOhesWBSzu@lists.infradead.org
X-Gm-Message-State: AOJu0YwFZwgWNnaIYo8mfY4GDm71N/8Bc9jLqoQB7mck5Q242YDxqXaS
	lKZ66POWxujydvwfhQvXx6/tzbaR2tkq6tiN37FiPTgGxe3B4NcaPojvZY1ITqcmbpkFJ9mnVYs
	NIXac/9RhZygYatKDOo+PUunOn4Ai1xtcAuNHPfacWQDN7xsuxylnQfV7QWStz2ofOd2UQasFN/
	pXMA==
X-Gm-Gg: AeBDievBkx+tCybrpv/58QlCoERdbDPlltkqd2GGtECyNI40oCd7nxFYH3oi85yNR/z
	a73cWK9qfgiJycKZyE1wp9Am+vgbbquwgxKntoA1Hj+20QxlJXqJTS2A5MuWsN2BLZEamRjxkIw
	lPLVT6RggAR1RucagfXo1XVN0t5rKg9ZXdgjru1jlDdDzz3c/M4RN34YyvrHsL+0vwFpDono0yc
	JS6z1qDwy7sVii/6pkJ3iB4Ggp3pa79i6zuncGFyHKz4Z+Sv25BPLOgNIWfAbKaHb3PxHsnlzHH
	2TYFY+qn7x+2mUw6FLiGdFtRtt/aZXGQ/2rtojVCK5igIqrdO4IHdy4XaEWuUy/+0Zt4Zk+R03H
	hDl/RGEYgJZf6mfbF9pFvP8PO5lIUeJroCouZIYgivKsVIJIX3JDyqvQBjmPd61NwiSqohX1rCv
	A=
X-Received: by 2002:a05:7022:4186:b0:12c:3d1c:b325 with SMTP id a92af1059eb24-12c73b2bd66mr3631737c88.14.1776592337877;
        Sun, 19 Apr 2026 02:52:17 -0700 (PDT)
X-Received: by 2002:a05:7022:4186:b0:12c:3d1c:b325 with SMTP id a92af1059eb24-12c73b2bd66mr3631727c88.14.1776592337343;
        Sun, 19 Apr 2026 02:52:17 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53d2cfd3esm9308003eec.21.2026.04.19.02.52.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2026 02:52:17 -0700 (PDT)
Date: Sun, 19 Apr 2026 17:52:11 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: bibek.patro@oss.qualcomm.com
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
        Dmitry Baryshkov <lumag@kernel.org>, iommu@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, srinivas.kandagatla@oss.qualcomm.com
Subject: Re: [PATCH] iommu/arm-smmu-qcom: Fix fastrpc compatible string in
 ACTLR client match table
Message-ID: <aeSly0N7IkXHYExB@QCOM-aGQu4IUr3Y>
References: <20260408130825.3268733-1-bibek.patro@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260408130825.3268733-1-bibek.patro@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=GthyPE1C c=1 sm=1 tr=0 ts=69e4a5d2 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=R4lqVJv_ZxSicD1_n0oA:9 a=CjuIK1q_8ugA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-GUID: gmRMHozsdawUn2Qz61PTLzkpuU1-COgU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE5MDEwMiBTYWx0ZWRfX3HsYP3EzixET
 A1mfSEV08bZgOMpx1MpdJL769gF1yLI3G4erX7oWbTYdeAAPtC2zIbxqbDVH8TQDnV++hxz997d
 IUuSntz8jU4kkuU4pH9K9W03eTtNuV1/4C6RT925eAifQ/PD8ChD+Ip2hhiQVlpc3jVAs1+Wa1I
 DLn1wuziXoteXbSnLRMXATLZvUoEP0PFHwgGllJ5l89Vq9ka957w14xtPUsrt0TciOZU+zlx5PF
 OliYvjFJ9M+SnhiuoW+kaJBqoyAN7Mz9OFwe70Mqc1azW1ZHhEMshBpQ2sEP6UdeSNMbkJ9UoCq
 +wAhUEBJBVn/alMmqZgbSBQ7rhGFqu3W5fsVOsPeES+VbANk+prjBoAfhvJksogQmjGNNbewG5s
 dgNufYVCgyA58eHodZHVHFNFXGdWPJvGi83+w++IxGdEMhdvM0MruoA+UA1Gs537yBDWIlWpyQF
 9jzipvQvcV/IuHxEldw==
X-Proofpoint-ORIG-GUID: gmRMHozsdawUn2Qz61PTLzkpuU1-COgU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-19_03,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 spamscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604190102
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260419_025221_046582_CCDD7245 
X-CRM114-Status: GOOD (  11.02  )
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

On Wed, Apr 08, 2026 at 06:38:25PM +0530, bibek.patro@oss.qualcomm.com wrote:
> From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
...
> Assisted-by: Anthropic:claude-4-6-sonnet

Nit - coding-assistants.rst suggests format:

  Assisted-by: AGENT_NAME:MODEL_VERSION

So I guess this might be better?

  Assisted-by: Claude:claude-4-6-sonnet

Shawn

> Fixes: 3e35c3e725de ("iommu/arm-smmu: Add ACTLR data and support for qcom_smmu_500")
> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>

