Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B6FCC531F9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 11:45:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hA+G3FWrRx3/7OkOiAbGkn+XAS9qcZ73GDYscb3Fmd8=; b=HM3+XoR80TTAshFlVpt0R8A5hz
	wn/Ur5GKzIXRCGrrBSQtuPLhf+xUUjuQKdSROa6DZCeD8y0F3bv8NgqTOrSax4lNs/0pH1HDjnOsO
	qpzm31mQQsdh6kvuymXc3UY6py9vWp4yZwTEVl2jnVwDQ6MRE2JHxY8xQMsuZqxMG3CL75tigEOGD
	08AgPcT9QnYEqxajKvEndd8Hob8W5wbf/AmINpBuwLEXM6s7PI0b0RL7sLL7ilNejbsf9dH4aR90/
	I1XitIX7D2cW+05p7dtCZsitbMvKVr2IWPf8Zol7JDSkL2wxuPuBKqEGSM9rZnuAM51PdFL4UPSOO
	/Ecn6GVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wogF2-00000005778-2CTb;
	Tue, 28 Jul 2026 11:45:00 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wogEe-0000000572W-467T
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 11:44:38 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66SBHRx02367469
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jul 2026 11:44:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hA+G3FWrRx3/7OkOiAbGkn+XAS9qcZ73GDYscb3Fmd8=; b=jv4gHMYSGE11DGLy
	bbwGnuVgx0f+jXMaPrkNIUcRwR3OOq9j5GE+jwCOrOUndea01hGkW69umTYoNHKR
	x57Di+bYhNmSsKsMrQkvsN4+tH17tf4fsF2Ig7U28Tv675nPEvKvVUfW/RIetp1V
	COyw6PsU9l3wWL96iQbwcCsxRnj/f7xgbTe1PBAJEcYv+92YJkKz8zC42hNT3nT0
	2MO4aFMxuUwW2ODdZamKdWjchQJYaUcTFYsLhTuyoYAtMwAXR/0H2bRXjnzF0Lss
	yEZKuh9y9fmGXHAkSDgi6ekOugLFPXh0M9viTEv/wmyXlwsiAnNiCGQg23xqz9Y+
	i+c8Mg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fpbp8c46k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jul 2026 11:44:36 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c26012cd0so37083721cf.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jul 2026 04:44:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785239076; x=1785843876; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hA+G3FWrRx3/7OkOiAbGkn+XAS9qcZ73GDYscb3Fmd8=;
        b=aZQQB8uJO799kGID4cVqEgkvaQH6mG2QMTGBwt11tAd2GbX3F+akprPBHioA1UUlpl
         M4YnHiSHW1PzvoGFmfDWrLtocck9BX2ufYIJ+hazfb0sTTk2Z8HnpiB+lAWnlKU5quXI
         BdY918E1PPmOI0O/N8439pO7ZGd+WmcfCN1jHTX8lmRtj0qF5MUwXh8dm26tDAOQ/GTX
         8q/kup7jD2eStLKpB+KiD4E20jFwQTlJVgZR/zpzl/XwPFB2w7iOGqI6NytOHkQFHJge
         A7oV/Rz1MrFnLXnlGp6x0jTvLC6jETQefq0rmRafHVHoT8jfDY+0w0PtyqvtK0/IXiHH
         b1sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785239076; x=1785843876;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hA+G3FWrRx3/7OkOiAbGkn+XAS9qcZ73GDYscb3Fmd8=;
        b=Q45n3jrHEQqfDJxV0BuY7uXNzy+5iRt3V0YrDh0vtYNZSD+myZvf4JtTwfyxQtvwK8
         TOlZUBVL95xBIG2RKvBiQQZHswHykXO4BUNM7BV/GGM1SejH9yNVIgmDaJlnTkztHGKx
         4eBAXSubC3mrM0NGsOTcu/NdBiPm25YZ3GPId84SFnaRKksXWhgS4AN9WM7aTTzIglz9
         B6+InGGnuSPXCPzMJDkEJBAGYmyCaOKkdepLnWp8iFPNxwTn3YljkvEHCNyN2ktCOxiV
         mBZXnLPOwIeiKTXEkal3DQqklyXegGfUTthCbRh2Tw7GdDOaJXSi9b81WQ79A6XeMNzE
         I2SA==
X-Forwarded-Encrypted: i=1; AHgh+RolZLRKEgR0eF3k7RNiAIcgPzFQ4YnseuWDgUIbM5cMLgFM3nw/crYGDBtGJVoweTAlTprYJ3cUmnWvKf5k35vE@lists.infradead.org
X-Gm-Message-State: AOJu0YzMFSA7tUEtNRijSaceiHNVGP0K85ey25XvdHlrwPL7ovGELoiT
	bzsCSQFVkIZzCS8zMuuv39ybTdGSaMTmehPobqSNn2A1mVlKf+wbBz8iKJp8jTPDSuBrI7gj5p+
	clhEEgGBlP5tZxdVRerYGIzVI3LzOWh7AbhdNE2nuhMvT/PmARcZm47AAIEYXdzR7GQBK8YWXoo
	WGIw==
X-Gm-Gg: AR+sD11hZNDtrvf7qsytLHZVE2E5zeVFom953EG2Kuho/w02Vi0Sc/JJrMeCEhCy9cM
	8oF+gET4qCbIKeYDsaLrZ86twy+wpxyvPsyt0LhIYf/3BOYz+NnAPogYMKQfvqREbxRVA5hvlPN
	6Wxhx7HxfBAl8AuXVmm3miTdaMzQYXOdXewzO8PF8IZ4YN/pybbCOJRxCdcYkik0Bth5gqGwNTn
	Ziey4X88uQs+fxpIvDxg6VEVWXVlvLj44NPeeTk8ws0N4cHd9Vp4gqWGy2CjjZKjF/pTx7tJ5ZJ
	bOzpCu/YhH21lXw3Klb2XPz1ySYCk+/SnSXXVVuNiQ2XmWe7q2yNq9yxzEmB3RVTlPRdCkqSFM2
	OpdB5urjHtvwmFEfvvhARJ8U2vYM=
X-Received: by 2002:a05:622a:6099:b0:528:2c84:eab0 with SMTP id d75a77b69052e-529d6febccdmr14880751cf.33.1785239075508;
        Tue, 28 Jul 2026 04:44:35 -0700 (PDT)
X-Received: by 2002:a05:622a:6099:b0:528:2c84:eab0 with SMTP id d75a77b69052e-529d6febccdmr14880451cf.33.1785239074900;
        Tue, 28 Jul 2026 04:44:34 -0700 (PDT)
Received: from hackbox.tail37bb1b.ts.net ([86.121.163.114])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496c46160dfsm68407265e9.10.2026.07.28.04.44.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 04:44:33 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: linux-clk@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: imx: imx8qxp-lpcg: add missing MODULE_DEVICE_TABLE()
Date: Tue, 28 Jul 2026 14:44:10 +0300
Message-ID: <178523892597.3206426.9839796050090970254.b4-ty@b4>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260704150344.59563-1-pengpeng@iscas.ac.cn>
References: <20260704150344.59563-1-pengpeng@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDEwMyBTYWx0ZWRfX8gYP54qBPZpw
 ISH2sESIfSczPM8DQ481sKhfrdtj0gz80/ig+V2ncSd1D9OLwh6uDiU5GVyqM3AISSsqEq+W/HW
 NRvrsQrIR9jQ4mswx2riGK6IoRVzhlw=
X-Proofpoint-GUID: ju6DRj8maAVMmDDUgWLqne64yX8f8g9y
X-Proofpoint-ORIG-GUID: ju6DRj8maAVMmDDUgWLqne64yX8f8g9y
X-Authority-Analysis: v=2.4 cv=KLJqylFo c=1 sm=1 tr=0 ts=6a689624 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=6dw9+iwJWV8PcCi9M4lOBg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=_ysCb4Hr1M9gRo8ogBUA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDEwMyBTYWx0ZWRfX4WT/2qZiZnJk
 sVc3w2DA9Av1c6PfdXyffdAWH9KJXCzqdxKp9dftY3+J4/vIs35zKrCs3umcOwHVpryOdkLhuN8
 HVFtgi8qx1W04Ee2BxEjXGyRhOWowK4NtUlbdBOBvP5F0i3ZD1GQToHTeyL3ulTwsoYxFTtcMHT
 wHRh0+NAQqi8+ckxGffbQ4qrtW44oVamQOQBSqXg3slvViL1n4eKcYNbjs2h87tX2mxhHJd3baV
 rJgduWJnS7pb2+2QSzLNKa3g28K1jkYkhpen7rwTM9ejbIOafTypLc8VG8lqwfg4WWAb29i0G56
 AY0LkZb0Up0NA1SVviCRnY4/QzGUPTZ+6qtMQMt8sJ2eAJugI3H/XiT8gOWn61prmDEMmSKtyGZ
 2v0g84uYwZUxMtDAn6baGzuc/lJFFQ6c6xSxlVhBeadrGGbsbi0fEwZK0L1xz9+t0m9iIXOxIi9
 BUtmyizcuY6XJ6OBTXA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_03,2026-07-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280103
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_044437_018252_ADC0A2A4 
X-CRM114-Status: GOOD (  15.10  )
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


On Sat, 04 Jul 2026 23:01:41 +0800, Pengpeng Hou wrote:
> The driver has a match table for the of bus wired into its driver
> structure, but the table is not exported with MODULE_DEVICE_TABLE().
> 
> Add the missing MODULE_DEVICE_TABLE() entry so module alias information
> is generated for automatic module loading.
> 
> This is a source-level fix.  It does not claim dynamic hardware
> reproduction; the evidence is the driver-owned match table, its use by
> the driver registration structure, and the missing module alias
> publication.
> 
> [...]

Applied, thanks!

[1/1] clk: imx: imx8qxp-lpcg: add missing MODULE_DEVICE_TABLE()
      commit: e89485455ac49925565061733c0d73d568333fc0

Best regards,
-- 
Abel Vesa <abel.vesa@oss.qualcomm.com>

