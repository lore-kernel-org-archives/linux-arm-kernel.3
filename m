Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69F8BC54EFC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 11:44:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qa17nlAEivQSWbzaXs80kMBBgDJF4lnbbP1Lr7oQ5Oo=; b=Lyer8tFkhldoKzMp9KY7QzdTpA
	0xIc6IGTpnLw99PeCdbFbFjRY8eWwcqo4ZFggpwJGlYCJ4308eyDtBT2pBrc0PMh9DlMWD+b8DP7o
	Rm/mHfxb/9krg5pOpBAJjeeeMxSrtksxmbY3QX3SZMJ8Qejcvyt2byIGMriLny4BzejDkZzyg9+pd
	XYMW81EYJg/PLXNs6OmC6qHL6rAEAYleSr1aj6+nCKs5m7GmyhTjnrP7RAmO2QgSeHbKwdOV5VI5a
	oGyFp93mQabjwJlNBKkIg5BJkZxXrUa1yf/L7/rMVM9FHirByP888d4tKdhdplqycIvkwfHDEN+/n
	HJtRm2bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wogEe-0000000572E-1bpV;
	Tue, 28 Jul 2026 11:44:36 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wogEd-0000000571u-0QNN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 11:44:36 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66SBHAI53751271
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jul 2026 11:44:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qa17nlAEivQSWbzaXs80kMBBgDJF4lnbbP1Lr7oQ5Oo=; b=dlWMw7e6Hx+zrIVY
	mwfo8+7Z40SpalpbdMg5hMDhB6cemlZSw09jDWcABAp8hXc5CNhP1hvy0fbfM+pM
	l9UliaEl/gRqljos8B1lP0wtCg/OmxfDgv5kA5Dn7oDpcIgtrwKfHO3ox+XvXoIF
	z2EMctVZA3TPllqIWu8joxRoRijqNrjoZND3WZR6RtfhO1GyzamiZgRvWXuaRtWs
	J9sdqE7fPmm3Pa9e3wwYz+4FiIIY6i9I4/0EEbOMEL9xg9xm2zJgvOsddEFL9mxA
	V1o4ZGlMiVe18xdQ1yWe+/+xCkEgyXGXD0KpVVZ3Jz3ldZWxLaT6fbPQzHf+CAkL
	2qx/sg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fpbp5m39a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jul 2026 11:44:34 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c0e702df8so46284541cf.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jul 2026 04:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785239074; x=1785843874; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qa17nlAEivQSWbzaXs80kMBBgDJF4lnbbP1Lr7oQ5Oo=;
        b=cTCdJhuYyKHx6k1z5Y9KIhItp9akk2SuR4X1jaxzg43DDty106QTialOU4/2DUcW7e
         jZWzi535vn0BdIVlteWm25ZXuws1nP/DIBGIBgVibQbBsDY/CMjq3qRko+f526+UYgXz
         yw1B9lYTwvcz6E6frOqPYKJeLQZFbk8bWAQSIE7L0zI1npOlRqLWNAvlFcznSvN7wZzw
         jpN7eFxEVihwp0xuE9EAp7Efh4rDyshqYJy6rXGCklLvXvsO90NH9ueS42cUXcEXaZZg
         IPaJjg0E8y6BwICQfvpUhdcDriW0xsgrh+PPbURUfhzL9+L09M2Iq3/Sk7Sw6IeuNtEW
         b3Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785239074; x=1785843874;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qa17nlAEivQSWbzaXs80kMBBgDJF4lnbbP1Lr7oQ5Oo=;
        b=PlfHZ5tCG50Ym9X8g/Yx26KqhqUos2xfx/sylLZuI2KnqmhYsj5lZkECEkR1WyKOeh
         j7gBQ4H1/PxLE2s6PrknQpY5znOSJVVwyeomoKQVDFiNkcUfa48AEZLFWtITkiiPHo4P
         13Bfl9+LSFnIRJNkP8IEUX+RIral11wONytWa7nTajrLMf0Hgq02/ty80zqugFpRIgbB
         Hemxj46ZWVLNbAibJ5n8kc6xMGemEXo4ORiXdKht1a58OBI55DJZVdiQXI0AB5ag9MET
         st6STFUsNI1JGXB4zYO5JzNauSxNdFQoPTtb9pOFumfOCJWuiTfWoes8vHundj63+PG3
         s/ww==
X-Forwarded-Encrypted: i=1; AHgh+RrXqrdFR5sBHloSr5SCF4bWbicVV2ENWQj8fJjqjA4M9PbpcRaRAufGlIpNl+8+9iaOZDjrU6PCBmZYr93bje2H@lists.infradead.org
X-Gm-Message-State: AOJu0Yw2pUrgi027PIcu+XymVWgOqqDfbgV266T0zETKC0I6LwzPFexY
	ZvDtDEOZaUyuUJWBmBDEzuEXjYDHwX3eh/8aLKTeo/osUB5R/rkIqTfjCdqAjqScZcb2TdhKxlt
	07fnpa+hnpi4lqdmmxWGCo87RTwymHjaxPAWhdVYpYg75Ed6YZ3KypdVt+h4GAPNmL0Ib/AkmOm
	96RQ==
X-Gm-Gg: AR+sD127l58fDwfUG/pY1Ld1d03Cc1ynG6kydgTBHJOzr3vlmHNUzQR4jrMAv1r6HV5
	tYMvqlnkMeOoHSZ+FdeeQBkgUrzb0ODNWhFqxO7cvqJrkUFZoOOrYlE4B5Trdci7Tzh5wsGUBP0
	NvewGjUNodoZe6/VA439V8rJLYFPELqvDRnxdXO7Xw5g1KzhpdG66OZgErverP7EwVDkEQxMSwr
	AUOc2/XpVvmIv9o1TH0DqXmlAK+Ff2R252pnW8CGbbEwBVmSBh4B+UCish2hbb18O+rdOjK4yxw
	G+ajI+aBA24AH3np1NVMF7FZeXdgJ1nP9AHyeyEGwNDdHAtQg6hwttY/75IXGpyujQLd/XPf+hd
	4PLvxnQKtSYV10B5Bv/NcMGisxEU=
X-Received: by 2002:ac8:6f07:0:b0:51c:ae7:fa1d with SMTP id d75a77b69052e-529d709e483mr16956591cf.5.1785239073414;
        Tue, 28 Jul 2026 04:44:33 -0700 (PDT)
X-Received: by 2002:ac8:6f07:0:b0:51c:ae7:fa1d with SMTP id d75a77b69052e-529d709e483mr16956121cf.5.1785239072790;
        Tue, 28 Jul 2026 04:44:32 -0700 (PDT)
Received: from hackbox.tail37bb1b.ts.net ([86.121.163.114])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496c46160dfsm68407265e9.10.2026.07.28.04.44.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 04:44:31 -0700 (PDT)
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
Subject: Re: [PATCH] clk: imx: imx8qxp: add missing MODULE_DEVICE_TABLE()
Date: Tue, 28 Jul 2026 14:44:09 +0300
Message-ID: <178523892597.3206426.17434896362828109375.b4-ty@b4>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260705001705.70400-1-pengpeng@iscas.ac.cn>
References: <20260705001705.70400-1-pengpeng@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDEwMyBTYWx0ZWRfX4ZSQx2ZwTXoh
 +8fvjoqM3bNBfmiWoxez4ttfI2IYw5wqGD4NbwDz4WC5WTf7dv8hGkBHxLnwjMvf/qxEopBokez
 dzN6msklbPgD/6BFwOz7vWHLNpGF5Cs=
X-Authority-Analysis: v=2.4 cv=XuDK/1F9 c=1 sm=1 tr=0 ts=6a689622 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=6dw9+iwJWV8PcCi9M4lOBg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=_ysCb4Hr1M9gRo8ogBUA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDEwMyBTYWx0ZWRfXwPkaX/2DkT55
 PWJmymOX8RRk425ualz5LTAZd2bsCV08Etx4N6js1Y3NyBvlvLxW95YDwqVSUUcJkqUC6GcC7AZ
 GYhM9Fh1aX3viQ9Hhn7cyGKoRv/OnXiw2kAPvnlvU+zb6JwhHgav7+i8/HMqGKHIarLN5HZ2vCe
 IIDdN/9zO8hEtrqDGrvK/r2qzDmHHy5Jnsqtcfo9P4aXt6W91+6IwJ0nzUAHkPrMKEEHXPvRtIl
 5MbVadbBZZd7TCDUv63Wrx+WxkX4ARxXufTESg4GkawkFhja4Ok/q+sMwzIX6Z1upovBIn1KxBu
 W3+qa6DGQ2tKSoa9MBkWitqF2c+gWUMYbDColC6xX9kkWk/kQmvWXw9FOYQ+vCg4fF0XIlJ0xDD
 DxthsS4ctXpPsUAygrW2mi0QpKlsuRuKFSvp6IngfGFA4CoA33Rzqj6CYz7oOBWY6N8Ju482G0L
 dpXlyZMlFAmi8QBsGMw==
X-Proofpoint-ORIG-GUID: BYvWppGMaHCBPOC3LjfrpYBRGNlDicHR
X-Proofpoint-GUID: BYvWppGMaHCBPOC3LjfrpYBRGNlDicHR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_03,2026-07-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 impostorscore=0 phishscore=0 clxscore=1015
 suspectscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280103
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_044435_162695_498B186F 
X-CRM114-Status: GOOD (  14.78  )
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


On Sun, 05 Jul 2026 08:17:05 +0800, Pengpeng Hou wrote:
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

[1/1] clk: imx: imx8qxp: add missing MODULE_DEVICE_TABLE()
      commit: cd21fdcbef3fb32136f72075ab668b075423b3f6

Best regards,
-- 
Abel Vesa <abel.vesa@oss.qualcomm.com>

