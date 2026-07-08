Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E99DC43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 13:08:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WOOq+NNu+tyhPReYKnu6wDK3tTFUATf17W5IdwFPg9M=; b=H4bdiwiKGpXpF+xhqHpmWOe/7C
	GrJTdG2NW5W+m33FTajpt06hJZKwQW2QFuANyX/GUM7zO8nkc0BudRthN46UJEmf9fjf2eMXB4MST
	YLF0vUrMaRatuHXfYSkzPEzKFW3/rGvMqIdq8ja8SZhf7sRxh8tx5caQVgTjD+g1AjckLGDoOalYw
	ZnPz80van0KYqEokIiY+VbgcMJatQ+Dp6y3vAicmmPh3EQKJf88gfLuPJ5pzZAcSY5MZodQ3sYVq5
	H/16i9lgicTfZqhrYZP2eQiyNcYmN/7E8rkKMxkn/oeIBDVD6yKDOFHAn15DOcyrif8ZIllTa44C3
	RC8GWZww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whS0O-0000000HAe3-0oGA;
	Wed, 08 Jul 2026 13:08:00 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whS0L-0000000HAdj-3fya
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 13:07:59 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668D7pEV2677922
	for <linux-arm-kernel@lists.infradead.org>; Wed, 8 Jul 2026 13:07:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WOOq+NNu+tyhPReYKnu6wDK3tTFUATf17W5IdwFPg9M=; b=bhLue+T1HZS6Z1yl
	0SK7piGEP/m4bSiAAlhhNU1mTl4FX62J6rU1q96kA8aMseiY9ZWto/Dd+0Miw/MA
	mR4PyKQbN0+ZHEnUBucu6zOkAfsXEujfYWmhI1l4vmbj7e2jH7cR7VwXg/Z3crhN
	8NMEObbUbI6ULX1L6+S8JWxbOZ31JSqX/EATTSay9ArAKJaG68hvW+2EcXMK96to
	NoyER+PjRKSJ3ycZpb7+FNwNa/8pI5bYh5dQkZYYYmwi0kkWyLAdJpvqie26YbNn
	Nx4kVOvaFr1YQ5T3Dorvfj4wI18xfQdrLiWC94ltSqRHDt3vqchC2u6ywJgry83Q
	kdthGA==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9q5s800e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jul 2026 13:07:56 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-738e5b5ef68so201780137.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jul 2026 06:07:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783516075; x=1784120875; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WOOq+NNu+tyhPReYKnu6wDK3tTFUATf17W5IdwFPg9M=;
        b=UWaQqt7LCORjYzrEZOmfFV65Y26LWE1C0tHOsZt8MKQYaqo0b6s6klIx9Az0/TuBdF
         LZ4uBS3RCvwrzj7W7XS0wSZDkx2LsqbJTR/aTNYLKU03YDQOYFgVOkSjePHltESquNoB
         OQY/Kjt3ex78OqPMFyp4xYtYQdiIrF2naEsVeH3NjMVbI30/txfbsg18tgZPYwNYpMFM
         EoRW3v6Bb5I43tWLuSPmCBs07Ot/OPtj25nToYxbqOo0ZngWx1wTmRAxo4OuuiWb18da
         ZHtu/4E2ii5mb2kvJgOWkj5tMVy4esoszZOQtNPLwcbBqTl9BxpRVH7w5rX0ON55uX9y
         R5kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783516075; x=1784120875;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WOOq+NNu+tyhPReYKnu6wDK3tTFUATf17W5IdwFPg9M=;
        b=ieD08RbvbyF/2NqzTFZR6k7DX41xjIuXcisH02B9UXuPjdYUJs1KU0G4qvfx6vZ2TP
         jjv2pADJeXAL/1/TDT5Bhkm+B66r7hxzWtUlpdVAUOzdLV8vCN7sF75P9DFqf3ySi0Pr
         GHPra6SDvx7GINAV7sWW8EzkYcwNrl8asuuUHnoyPus1JVaI+X+9II9892ysKxC3cTj1
         yKxQVRnUVHP0pi4+L/b1OOwCA/98C3iw+Og1QV7lJOfID8qV1Npnc+00Sv/nCpFF7t0q
         hP7cKrdlw/nUX8wyYYvN9mSEl7/KGhdyt3/2PZWj0tNvbYhH3xTOIHVDrg4ZsNcFqQ/0
         uhGg==
X-Forwarded-Encrypted: i=1; AHgh+RoY4ONtbQemd6UvrE5jzKZwA3tCkcAklLtA80GMXLkMY9Flu0Jm86SwNIJ2RZt/KvQQiqp9Fqa9/g6oyNxw1iA/@lists.infradead.org
X-Gm-Message-State: AOJu0YwbP8UqDCl8LjvJvjN3A5vVO1Whc9aWDJlpH4jQC/6dHBc9sXdg
	qIuYB5H6XhLwowO3Zuh6BuUg9xd5EdwuL45xJGVSw+MraGAhtsULQxYntTi/TQvwB9gmc1NREMU
	Ku6YI+Yl7cpR1+O5U6Nj0KsU7iPeoOPi1R7y90oeNyOZofiKCzUSxKiLfnC/P+RJdjL1mP0d/Km
	Ur0Q==
X-Gm-Gg: AfdE7cntBn7XJaVDVm0G0TBog/Ip+Wa8im4vYOoCe63B8fGAyabNr9oKc1cE45nTiTS
	mbGW/VFPgHTdbNAbHfJ2Aws6ESUOq/PXPX7+jVSkRUct7lANz+R1/911oUTwNy4UVQ7Nc1V8wr5
	nilJrev0uJei+Po1a/GKYAPIhj77g4a80iS9oA+1sg9NvCD9/BG+fpRXvAJnd4Dd/OAUSWl2Bci
	wIFs4gj9Z3leH0UJOqiMnEYuGb8S6uZ84Shok5Pb8hn3wfBU1aCWvFUjdFlVJ/VUL+ZzSiw7BZ/
	/6Xr7a8C+A27hjej4kzK7k7BtBeX46rzN+ctlOInpW2MrN3sdANFBdNx49e5Bvkc2l6CdTHXPRD
	PNb8N+fw58X+JSw==
X-Received: by 2002:a05:6102:41a3:b0:73e:9fae:5841 with SMTP id ada2fe7eead31-744dff81cbdmr1130781137.29.1783516075439;
        Wed, 08 Jul 2026 06:07:55 -0700 (PDT)
X-Received: by 2002:a05:6102:41a3:b0:73e:9fae:5841 with SMTP id ada2fe7eead31-744dff81cbdmr1130755137.29.1783516075014;
        Wed, 08 Jul 2026 06:07:55 -0700 (PDT)
Received: from localhost ([155.117.96.35])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-744d6a3ee7csm1525979137.2.2026.07.08.06.07.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2026 06:07:54 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 08 Jul 2026 21:07:33 +0800
Message-Id: <DJT7OBVIB2J3.N6UA6SLKJXZB@oss.qualcomm.com>
Cc: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        <linux-aspeed@lists.ozlabs.org>,
        <linux-arm-kernel@lists.infradead.org>, <imx@lists.linux.dev>,
        <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 3/9] drm/imx: replace struct drm_simple_display_pipe
 with regular atomic helpers
From: "Ze Huang" <ze.huang@oss.qualcomm.com>
To: "Thomas Zimmermann" <tzimmermann@suse.de>,
        "Ze Huang"
 <ze.huang@oss.qualcomm.com>,
        "Alexey Brodkin" <abrodkin@synopsys.com>,
        "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>,
        "Maxime Ripard"
 <mripard@kernel.org>,
        "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>,
        "Joel Stanley" <joel@jms.id.au>,
        "Andrew Jeffery"
 <andrew@codeconstruct.com.au>,
        "Frank Li" <Frank.Li@nxp.com>,
        "Sascha
 Hauer" <s.hauer@pengutronix.de>,
        "Pengutronix Kernel Team"
 <kernel@pengutronix.de>,
        "Fabio Estevam" <festevam@gmail.com>,
        "Linus
 Walleij" <linusw@kernel.org>,
        "Hans de Goede" <hansg@kernel.org>,
        "Alex
 Lanzano" <lanzano.alex@gmail.com>,
        "Oleksandr Andrushchenko"
 <oleksandr_andrushchenko@epam.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260705-drm-simple-kms-removal-v1-0-b4e1ca053623@oss.qualcomm.com> <20260705-drm-simple-kms-removal-v1-3-b4e1ca053623@oss.qualcomm.com> <1c84099b-6f0d-4655-9aea-015a821b50db@suse.de>
In-Reply-To: <1c84099b-6f0d-4655-9aea-015a821b50db@suse.de>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDEyNyBTYWx0ZWRfX9xHmQKZRDhj+
 UjAaw4AJANRFXcTxS2E5uim5anH3MX8ns/vGLtXYryA9YYvsFhKGQighgqSGVedFtqlQfmiYtnn
 0XYRcej92/2fLoVVoIMdv4OLXuE2Vn9XMdAm2yVjYJtRtUxWBl7Aq7eMbAGtyp28MLGIK92iX/s
 szliJpGqG9xprfzzF+qw9cUEt0sSko4Fklv5x2Kgv8RJA4VNXWgmY2YGFUF/nmwK2bDngJ9DLH2
 YdPZLndVS+CBnhJa1PQuv8GNKKFfxCGlmU4RZaOrybpNh9lhTri74YPzgJGV3J7tMriUTIxnPyS
 +En7R45zkxhK3tZNV66ss9IMJRSymd75RHa7sUo1uDgyoKG3SwcHiAmRQhxZnnBlMg/7KP5z3qK
 QZwaU/wVlyfP9m9CxQIWjcq3bnXtiF0s6DX+JtUQ27z6nMS1Ycdhzm/BqXkcQH5Td3U0nuz77Gv
 ykoxwPTmfwOmm7aZ1sw==
X-Proofpoint-ORIG-GUID: qZwzNCSNNliMNmh77YovaGrux-zJCWbr
X-Authority-Analysis: v=2.4 cv=NfTWEWD4 c=1 sm=1 tr=0 ts=6a4e4bac cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=Ilsi1XWDFcrB9FjxRIUvHg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=lv_lVlItrp0lmarviNkA:9 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDEyNyBTYWx0ZWRfXyDNoEn5Tm0fc
 xYuH2bBCX+UIMP4WiJNX0w7GYRvX9sXlPW28Hu0UAZqzNegaKOwpbJMD04ziTdKBX2BeVw6fxSg
 7Yc3VplP9kpOpc8oj4whuyhU8FCS+8o=
X-Proofpoint-GUID: qZwzNCSNNliMNmh77YovaGrux-zJCWbr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_02,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 malwarescore=0 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607080127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_060757_917705_7F9A7744 
X-CRM114-Status: GOOD (  12.35  )
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

On Wed Jul 8, 2026 at 8:44 PM CST, Thomas Zimmermann wrote:
> Hi,
>
> the imx driver is well maintained IIRC. I'd advise you to split off this=
=20
> patch from the series and send it out separately. That is more likely to=
=20
> catch the attention of the driver's maintainers.
>
> Best regards
> Thomas

OK, thanks

