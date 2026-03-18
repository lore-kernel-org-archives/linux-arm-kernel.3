Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B640D103E198
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 15:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wNFrg2oTUsMQolNA+c8Q1QhSY0+oF9DCXiaDX1qrr+Q=; b=qpNuR7QHIz/FHS0FjWguDZGizS
	8drGLHud25Qi79qlPXyOPac5w6LTl09ZEYuYe7TcKbvj30kf6JYg2Pk70CV98I69qYCQ13BMN7o7a
	kcMuXji+79bpsu4LKTBaqZslu+loSoPq/BJc+5hU/ZMlr8F9tfyRgDw1dGlDkAo3Uvzd8hka9Dxq0
	UXBzQMwJpQp8BIXYEUp8zuz5xcJVctqFuCocLa1wo03qjwp4fons71W7NJmZbBirMJv4+0FBHHyLM
	LlcmaUx7RuWTUza2K7JihEAQ5uar7NKImmJHXMFm8iSiBgRNylUPDro3SjPp7Hc6GvV8XwA7AHdHZ
	SDvQSruA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2t0L-00000008jpY-2XzX;
	Wed, 18 Mar 2026 15:40:17 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2t0B-00000008jjh-2O3A
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 15:40:09 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62IFXH392966324
	for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Mar 2026 15:40:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wNFrg2oTUsMQolNA+c8Q1QhSY0+oF9DCXiaDX1qrr+Q=; b=h+6TkJxW8AFM/rjg
	UpLl7MCi0n7hgYiSt0w01mQiOdoLdNgKhX7Go61oZTr/wK0HvrirW5xq6O7IqaqZ
	+rVlrop6tI6KbF9beRhc9/Djw2Ms0TOSL2nGS7zVHAXBoXx/qEp8UvMHz21qDxyX
	kyqgYexel7j44oRfiCIr69gpSX8S/v53ktQOrrBrgaz96NFTSjmv1drIYYnlIqS+
	Ug9QnRpPuJ1PF7nchyG0hrK/6xAPI0LhxzaRJgjkmeWtB7OJEibbSFwbsRw25vYh
	3VjnKlvlCymIhPBjxPTCCLG0bE5hORUeD6J893qtCP5yKZEdmRCDl2I/nZvXPUZ7
	AyN3Ag==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cyj4ek6cj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Mar 2026 15:40:07 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-509007aea22so325121981cf.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Mar 2026 08:40:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773848406; x=1774453206; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wNFrg2oTUsMQolNA+c8Q1QhSY0+oF9DCXiaDX1qrr+Q=;
        b=Jsz2RTlxdTBxjrR9FSNPOBxvlU5lyDGTEUvhwkoBQTatN7EdcjTV1EJP6gWv7AQr7f
         N9mNUul8m+SsLRG2eJuT7YgHFavmcbXs0wd3pqOW06aM5AOyuyLHMghDT5OZ5u0bKYEU
         RNwGto2bRVQoUSHWm9flw1nwmkgbZ5gVjPUsLxr4W5BlGY+5C4iN1RxmqRu2QCEXBafd
         wxNXgKrjV3MY8QM2qZnoFu0sXc/BImDIGJOBkE0SUyG2HT6aACczlG9q482u/S0AmqxP
         Fkc3P/+AHcMTVVhAwffciGj4COoi2rO0wWbB5xV3gTCR5YLiLtytFH6llCLwm9L0wJym
         VWfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773848406; x=1774453206;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wNFrg2oTUsMQolNA+c8Q1QhSY0+oF9DCXiaDX1qrr+Q=;
        b=sdJd9/JceEpEkV5RLlHyRi7IoQeHH9uoJLIv1osSoTO27PxZTY4XyxIndrriKCiexw
         mPBg0w4wevFSbLnmAJs4qhDYjdOfr+Xx2YiFsTHRlrBI4YL4Yhb8fhKylnYvPDHMkWsZ
         GWtZ3gx3fyAFbnyt+iGQUOeCEDD9yiw3NqYrxH0sQ4JJbNfv2CoCNy2Xsr8LL8C9zSr3
         /czwkJPf+wdDLmhQoUZNJghjE2p+TSLJCufsL5CSvCL+Hpg2FPz9lRUUEy6x/Kgf2P27
         4Tghp/Ur5sbgj2dPMjmOn2JP5BYhQj3jpoa7ZPZygUXQJ6MU6tBkClgjOXxvmUM2eZyE
         whsA==
X-Forwarded-Encrypted: i=1; AJvYcCUpFfyEbcaNnlHGyMZoQ2Chs+HxAzAAs5REPmH43DE4c8+q2qEu1XrYp8jWaONovkhrt22UiLvozHacXupsikwm@lists.infradead.org
X-Gm-Message-State: AOJu0Yyjp9ugyTLuHt1VG9xs6x0hggV/V/RTpH8P7q7+xVVNMcAs8vTa
	d0wUKmiA3IMCBADClhhlk70eyMDd7ddB0NVMQFifFdvv4H8sX4UbWHyjfAiwc9REH3bQaRGRxrR
	/D00eyLlOzFFYM1uIxLSzpxcHz9Hn5rlBP7cmZUdq+T5YaJGhW8qP3R5LGyg5cE4tY5NVid3GE1
	sJjg==
X-Gm-Gg: ATEYQzxTMrVRjs2p707VdtmBYIWfAD9yU3nW53rywoygHxG//S6NC/ElsrMNultzxCS
	Iwcza0d+qEiTuyoQvodiwm3jRMUWMCY/sgRzz5Co1ScYL3KGmLCvnQ3Y+/XjXsiALuTBKy4oGcw
	kIN8P+BNBjngGimnCiS9kzqCjBNbD3OOr3Yd9gLOoTzlzq27syGNgKfLXmYfvThAvWOpKo7KVil
	/WJ9fLteyRczbVB0Zcw3ZZOD1dSWLWkZ9hapxBU7by0fzu3PQXnv2Ir78U9VarXS4MqEDgEA6+p
	tREYNfD1mk0o7OCaEoUUtuUJYi3yZFxENNbJhcJWSSLpOoBvOSUIumzJQJjCs9gdBQ8la/3V7gJ
	1LYCTm0vZCfGGdBzWknIR5nL93lY=
X-Received: by 2002:a05:622a:354:b0:509:3706:d135 with SMTP id d75a77b69052e-50b147d1e43mr48218101cf.29.1773848406000;
        Wed, 18 Mar 2026 08:40:06 -0700 (PDT)
X-Received: by 2002:a05:622a:354:b0:509:3706:d135 with SMTP id d75a77b69052e-50b147d1e43mr48217331cf.29.1773848405364;
        Wed, 18 Mar 2026 08:40:05 -0700 (PDT)
Received: from hackbox.lan ([82.79.95.133])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b51892161sm9227560f8f.21.2026.03.18.08.40.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 08:40:04 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Akshay Bhat <akshay.bhat@timesys.com>,
        Ranjani Vaidyanathan <Ranjani.Vaidyanathan@nxp.com>,
        Shawn Guo <shawnguo@kernel.org>, Felix Gu <ustc.gu@gmail.com>
Cc: linux-clk@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/2] clk: imx: imx6q: Fix device node reference leaks
Date: Wed, 18 Mar 2026 17:39:36 +0200
Message-ID: <177384710700.3709943.16185958208428898665.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260203-clk-imx6q-v3-0-6cd2696bb371@gmail.com>
References: <20260203-clk-imx6q-v3-0-6cd2696bb371@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=T4+BjvKQ c=1 sm=1 tr=0 ts=69bac757 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=iKs3dpp2RB4k51ZqCjcyjQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=phyHbrEdMFs6mcJ68IAA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDEzMiBTYWx0ZWRfX0BuxM1h/VKHQ
 1msBU1qDyXVnSg0F05A/+de3goKQyVr9HhcU+MbN1I0cjnK76Aq4LOJLvtEXnsv1f6L3YlYe4bj
 L729TjjUTdNpkdj7V8B9yix28lW8LJEzdfEzmWknAgquleRStddlNC7sN5Qw0WWS2guE30ZHGAv
 rkTPC/UGaAPeHPV5PgCAi6+4Aum1mZ1+nVLKXl8X13LsBLKSFIxC7sneqje2LuOGiVbJ925ZoOc
 z0M7bEeM4PlZrC3XS/Ga5jIObzdJ2Ad76rMCZZeeERwi7hZsvIxRFbNfvEOnZ3pwl5mFPR2oDYs
 QldjAc34B+QWxd7wzckEwUmyDZTpqoqrajSfagtGoTxZIZP9aYlc8l5pwCjBGtWDqBFW/XW/Ow7
 A7BKjf7Y3SeOcBfe/Ao0NybhCF4Hz6DJQnl54023KdDuAppWQMKRAMQjknC1fTPLMiTCSesE3ur
 cgjeyxtqy8jiuYJmvqw==
X-Proofpoint-GUID: VDDmZMnMstJ7SUwSjsTFwIiNzh5nC9SP
X-Proofpoint-ORIG-GUID: VDDmZMnMstJ7SUwSjsTFwIiNzh5nC9SP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 phishscore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603180132
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_084007_623548_C1CF5F2E 
X-CRM114-Status: GOOD (  10.30  )
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


On Tue, 03 Feb 2026 22:07:56 +0800, Felix Gu wrote:
> 


Applied, thanks!

[1/2] clk: imx: imx6q: Fix device node reference leak in pll6_bypassed()
      commit: a35309ef7112818dfcd592f6fe7de182d404c660
[2/2] clk: imx: imx6q: Fix device node reference leak in of_assigned_ldb_sels()
      commit: 98974b292db01d100681bb24c18bb7482e5a1445

Best regards,
-- 
Abel Vesa <abel.vesa@oss.qualcomm.com>

