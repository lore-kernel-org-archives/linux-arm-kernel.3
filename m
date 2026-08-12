Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12B57C5CFDB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 08:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AFIM07BsWUmRXowFn9qQEjJQwSE915UpKVvsGJRFiu0=; b=VFY4mkYlY0QDcdR4gC9egsiL85
	fuQdIBGtZ1u7GsBSs0sCoERN1eGIuEBYQfdCmzJAcH1WAoTUL8K58q8cgAUSWxxIXCFIwigl8Ny/S
	TYFVGQ3dDDH+Gk+naWwTl2Qiz904tOgOkO9tOcT8yItqgxYkVRvEoBQJOyBA8IWsiqCOEulTfOay6
	AFIeeuGHkEpgaMEhlf2zv2ssZmgidXJIt21yVOzlyBB91RkWndGhE3/aQnGqxco3evysmN4eRYAHc
	ZzvcZhKl+t6lKc+CEf1wtYuNv81mbdvb7pha/po/PWC2iYUvWVMk0LrhquDRPNq+2L1f0uXA0Y1Lj
	CN0ZNeYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu4OL-0000000FeLz-2nv8;
	Wed, 12 Aug 2026 08:32:54 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu4OG-0000000FeJj-3z6j
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 08:32:51 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67C62DEV2962109
	for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Aug 2026 08:32:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AFIM07BsWUmRXowFn9qQEjJQwSE915UpKVvsGJRFiu0=; b=CkDL8DAQ7U5HJ5gu
	1wiZk6P3XYhm6d4d9Pl6AKoAm0ojpYY6+9yiDJZDagzLZQTj16HDJomqpc5v54hm
	GjSEyRKSdQVk2j9FpqyOAoeTrOP+p+wWdbUdRWU/yYx0PWT8D8Et1aCgK4asxrLu
	BUA0QVwgeHqElbgMD6ra5qsvjO5su8wj1OYt0H/jivqkQ2lv9ithdF1oBONgCcid
	f1xHlOKmxkuRrcEQW+w3H5tgD3Dj6/hJFlo1HgELfglRLWrUSkx5BHrqFLUnHTIe
	s6AnqvpNyLsUsHayG1koazsaHDRh1sv/8JPb3KIjgGv77U1cYm15NtMwmv6XYC1y
	Ee1l7A==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g0jgrgqru-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Aug 2026 08:32:47 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51bf321d786so11670691cf.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Aug 2026 01:32:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786523567; x=1787128367; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AFIM07BsWUmRXowFn9qQEjJQwSE915UpKVvsGJRFiu0=;
        b=Kb02I5SDL1pm5khWhf8IV3bV76GxNbav6RC1qGuvhm/F5fUUdeNkpBsb7lIQn8Eyus
         rdYjHlP3RRHQbjwCvH9reAKtueW41JnC7FBL1MhPTPlWEDW0pl/HldL7BlyYv0UyFKDh
         uxhmElD5q66EdKDnhZg56UeFIaISeNEl9iCggVMWmhZA2v/0pDEfo+Ns7RCfNm0w5k+g
         5xcR7vjFeNXbkLa7M4XBJgfR6iYPhz5MX2P0+e18F8bSDFMA0zn5RSrMYTUspcwWB6qN
         fgQ4Oyp4RoTieANX8HjauU+6iQQpKcgl0RzSVaDwjCwe9x6if5rLHlIHC5QLkEk3eFwq
         W/GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786523567; x=1787128367;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AFIM07BsWUmRXowFn9qQEjJQwSE915UpKVvsGJRFiu0=;
        b=Hi2/tpgCt1Jl0EPma+/8zi+fJlJ0CVwk7BhXVCgtV27i8bsB/eFThXw2zo5Q22vpyt
         Pw1TLYrFlV3zPa/VdNaImGuAVmCwStVsZ+n8GrfmsJkoLjTCFSXnmBgRvKWFXrvf06ER
         CTsUu++8aoMbHxGq+J36eepOFzSiSSEEpxepn4ugEqTIWXGiOJSswMOPlzbdZyEDMJ5w
         LC/NGdn8wjMmpPJqXAsYLm+52rUzBvT4yKg9O/1Iy0T+33O1dXdlmFvhLgsKwx1/5OXN
         nKh27QS/XFmWqkP3uOJHTitxgKGs1lem1JXdb4upW2g1VAyxNhxs9XczxqQD6yJuMA+9
         bsUg==
X-Forwarded-Encrypted: i=1; AHgh+RoPfk5CeBGo/XNqNAn68v3MpJH7EN70srtYLqiZnc1v6CBfkxz0sg5lCQXI6joroH8hx2PiTG9bvbYJyDzYtNMV@lists.infradead.org
X-Gm-Message-State: AOJu0YwyEtFBB0BJ+ETL8LQ7Y0QAr1+Za/3lKRh1lvbNJW7kG7X9IcCq
	3AaWgMvv0qIaXaqdwNpkBk4ArruwJFI7+apobISaoLZ91ep1cNY3nn6Su00O7/J614rhtoMi0Zg
	6f7MkTa/6MfMw1/DzWrCDNok+re2r9ZTB/WuooveTaga7EAE7hmQSYeG3v/HibdH9G7RImX9PMB
	5/rw==
X-Gm-Gg: AR+sD11OPZoSVWmWQDyzeYI1Tn2O8LifKQaLY/vueydSTbiaI9lgOG1iqJsemg3lect
	0bt1O6zZdW5QNzlWCwaXPFXKwlFjTZ/lC0xgn3hf0dMqFt/NBicavJ9Biscc3vymom3FFWzVwFn
	26bGRAttPWkxoeAThycyB6rVa6IEXLuJKNxgCPAHEap3AyENsr+hWlnKaZVs7Pmo82ok97SDN7q
	uTuQKg74F63rxlTxjBDnKn/xREwJ5UaeejOhfHeryULwPukQiCdX7lzmSaR4/ppgDeOnheE/5mr
	SKQGMhfuG3TCdOJRhUtHgJ85tZAO9vj+Fu5OOBMvNnvSfVyR0b4/YPse/54fvxrqPGvT8Ahkw2J
	AfpGJ/8JxnNXVADwThMCe/vKTORdJhxmflQzuVwXYmaIRbPoKSNmlISFqvUzQoDs=
X-Received: by 2002:a05:622a:4d91:b0:51c:1d18:2fe9 with SMTP id d75a77b69052e-52d6469cf4amr25908851cf.5.1786523567365;
        Wed, 12 Aug 2026 01:32:47 -0700 (PDT)
X-Received: by 2002:a05:622a:4d91:b0:51c:1d18:2fe9 with SMTP id d75a77b69052e-52d6469cf4amr25908681cf.5.1786523567010;
        Wed, 12 Aug 2026 01:32:47 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:b467:f322:cd3a:615c? ([2a05:6e02:1041:c10:b467:f322:cd3a:615c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4997c8fa1c7sm47131155e9.0.2026.08.12.01.32.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Aug 2026 01:32:46 -0700 (PDT)
Message-ID: <447b83e2-5bd0-4b7b-ba4d-61a0fe400195@oss.qualcomm.com>
Date: Wed, 12 Aug 2026 10:32:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/7] clocksource/drivers/arm_arch_timer: Remove
 CONFIG_GENERIC_GETTIMEOFDAY ifdeffery
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
        Arnd Bergmann <arnd@arndb.de>, Andy Lutomirski <luto@kernel.org>,
        Thomas Gleixner <tglx@kernel.org>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-kbuild@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org,
        loongarch@lists.linux.dev
References: <20260724-vdso-arch-clockmodes-v4-0-ddbe447be860@linutronix.de>
 <20260724-vdso-arch-clockmodes-v4-5-ddbe447be860@linutronix.de>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260724-vdso-arch-clockmodes-v4-5-ddbe447be860@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDA2NyBTYWx0ZWRfXx4LCZEQBrRF4
 U7GfWq1n065pn1ct9f4N6HoEjy5FrL7jnvtJOubxPsXjBL2JyIL1mc2Wk7Bqum8ynZSS5zOnBFf
 uJtFrExJs9ESrx1ncELKBScibOy8XE1bYd20joQBJv2s9h+9LOkaDx3ZEcXQF6yQju1GrGveCen
 5PEybnXOlyywxWEX2VjAr7Y4kOzw+LtZmYDE9ukNVktlLLBf46C8EWF98gT5VovWiRlBKtfVT6f
 eUID7LYXohRDUrMZJe3zRyxnGJuW3iyUdwj4/irMC5eu92ntd+HUXMjP4emeEmhyDT95HYwoGQP
 VcStTuihhhwteFMOnAiCmiQaPkgcv5FbXlNGAtDa/RcVKcth+KXQm58hN5WnjOWjB79P29YAHiY
 rgeMzjJUDbgDm7lcfsQJcIyd33bJhjoN6W63sx7qnmIevqC2IqKME1buOaiYV2pt8C+DQz6rHJg
 lAeC37ZxcK6iytIhrVA==
X-Proofpoint-ORIG-GUID: NLiceS0zPP2JzHI5ovPJzJkS4KF3QKyZ
X-Authority-Analysis: v=2.4 cv=TNJ1jVla c=1 sm=1 tr=0 ts=6a7c2faf cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=eCx_7nzpRrifSLxMv2oA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: NLiceS0zPP2JzHI5ovPJzJkS4KF3QKyZ
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDA2NyBTYWx0ZWRfXx34KUpgaVVWZ
 +sN42gHz9mZoMeXgYTFCeiP0PqmnW84EanTIpsicy9Twa5sUtjZDVzoQvnPKb2Pg096HzRdFzWm
 QXgCGp2SwSoseh4NVHtRDYhVaSglULU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_02,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 phishscore=0 impostorscore=0 adultscore=0
 suspectscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608120067
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_013249_295044_2731421A 
X-CRM114-Status: GOOD (  11.38  )
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

On 7/24/26 15:36, Thomas Weißschuh wrote:
> Now that there is a definition of VDSO_CLOCKMODE_ARCHTIMER
> even if no vDSO is built, the ugly ifdeffery can be removed.
> 
> Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
> Acked-by: Marc Zyngier <maz@kernel.org>
> ---
Acked-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>

