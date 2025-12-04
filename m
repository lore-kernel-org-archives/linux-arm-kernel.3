Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00022D1CDCE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Dec 2025 04:07:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FQ7mzOMImMUOs34RPuqput2HkoJun9/eS+mTLuH1dZ8=; b=RqMMUR1m7iDSbv/N59I6FXbODD
	I1rYLBMUXFdBRAej4PH5LK3l+MStDIgVFXYi9NADiUP5BZFxIajFzscAQNVS9ak2gidphKZhSltQU
	OcKcxxhHb+FrPX9FtDJdj2iZMFF0lUeSZ5rF48tZlYOeLJvFG24gLuZxft1DV8aWqqjzhrGBgpt2/
	f2x1ZWpNI18Kr7ur4lTKGSrjTiUITDwTKLdmS4uF/2qS7BRS30fzQVh5Z0wjyv3L0ebUckZD2eDKR
	ZpQt+u/zSc7IHlYhfWVhOYu7ozIGNibz/HuPOEbud/ROnqM1DqDI8XwdbwhL2RAgAkh/nK3KwQAck
	M0jJjHSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR0co-00000007Qwe-3Si9;
	Thu, 04 Dec 2025 04:07:26 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR0cm-00000007QvW-1TgL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Dec 2025 04:07:25 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B3NmrKD2627188
	for <linux-arm-kernel@lists.infradead.org>; Thu, 4 Dec 2025 04:07:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:message-id:mime-version:subject:to; s=
	qcppdkim1; bh=FQ7mzOMImMUOs34RPuqput2HkoJun9/eS+mTLuH1dZ8=; b=ln
	el4yhklplQt7RzuAURYS7VNxgAOCvDzzBdZJJGntXyJi/5CwTc2u2fs2sZrSJ7aP
	O6uJD3X+Wq184x1ua6K/aLtOYggj9LlgaCyrYjoLmp9mDVUsVySKFKo/zr1YdBZf
	pGo6w8jSE0Wr/rXbIO1e87MXRJyEEMgL2apitVl38CV5kLYsqbv2X31bkuy2UoX/
	fNOAugy/i7A4rqA3vmYfjaxa5+EkDGCZfezoujzC2fd6w0qKFl4KeNnjfhUrQ9rc
	95IvWIdWKtg5h7r6nsq//j9irviBac/bBzC4RLk/oReg67ulU03sWWXFJ4z3KGn0
	7KPfnd6xS7At0rdOpMlQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4atm12an00-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Dec 2025 04:07:21 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3436e9e3569so805622a91.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Dec 2025 20:07:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764821241; x=1765426041; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FQ7mzOMImMUOs34RPuqput2HkoJun9/eS+mTLuH1dZ8=;
        b=kmGgkeVTNs9CTj8f8//RYYKhq2lNCqs6RtqZ9uc38/fAtiNi2K5uzSC13RdykVKCwr
         GenUqISdKQlVkvT2yzp73ObNRIq6NVUS6IM6bNsTtcb5y+eVCdDxx+LdOvVhSOWnrM1F
         uS1ndUKcK5q69qSrZheoLvx7DaZvJsXAbMt2duRkbxDx/Y1OnB6skuaenA9uk5jNrU79
         boOat0N6WKDturdZZG80ZYYzbc9G7f3Lck7Ud1Em947kEQJiWcqWckjZjQR6YVUuFpOA
         NJuXJnLupuO5dS0SSq1smVnXuRyhUQ5y2XBDt5TT133DCMraq2NGDHuMBoFPyIwZd7eX
         YoTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764821241; x=1765426041;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FQ7mzOMImMUOs34RPuqput2HkoJun9/eS+mTLuH1dZ8=;
        b=uNxIPqOF+ane1HZgZwahF3HxcELcJpkpY14dkhzmB6iGv4Dj4pPvGLun0raC1CkKNq
         PRucuXmgv2wPrIJSN1XrhXer33pEXV9LZR/RfqYQx+cyb+drlptLBwWw3BqKlMFqmwZh
         jhB0pnCIRrxrMcEesQR1XtjJSd0Zh8xUP3Ogqt25oOTQO3parXZC6hrpVzWdZeB+gGSr
         Dwz2Cx7z69g5tHTFQeBKTjr2m26Yt9I5YY1ehMa6nGDRHh6GDbpjePQ4U5cILXzObjQM
         LHUokWTuLlXYY3FKlmfJx67uK46crLhxi3+r8zKDEEngwfag3bBQ6xzd6c9eVREFzrBs
         omYg==
X-Gm-Message-State: AOJu0Yym9gr85pHvoZZal/yeW2pOqZS05AUoZAiXhnY6riVA00Lvsu+G
	qQ6wRPUGC/i7wsSpV/sDX5FDNpgZRSDOIKIDK6IXfo/OSZVv9NOfpF3a7DAjaD/q+wxM8HRU582
	wUcvOekt7kWEa4TlQT/2o7tbyEFj1kgYCFrg2A1Bu4DYhz1gzZYa/wnf82q5xoRDEsoBb9WS7rT
	UaxfTV0XSunw==
X-Gm-Gg: ASbGnctztRYlgiiaXT9sj6ImTBTuU8c0BRwwyF/kzZ8B44Sjgc32y54jaW0U0VCEx3U
	mo+sB0eHvrlbnZbpo5T0w5Rll63LslAzLcjEJipZVbHmYStSrP4Dg0YV7bNNGEBavNo6ksP4k6K
	NOI/eajrpX6UKXv8ncjXMpKVUcj9fiKkSG2Kb6VUjlwA7l6nrICpOmXTOofO5t5J/hUxKVH2LY5
	IDlGKrxSwvaEhtJR7jH0TbxSkRVMUPdXL7tRGB6hz0Yxvu04c9qOIAdf6GwiNwGHqnaw/K/2fkO
	93/coT6QxgdUQqVGA3Yalb+Wdyy/LzA6mQ/4YyYcwCDmBhl2lPwH5QOm/5zg08OTA2pdvw/MKIf
	7Qm0jciWnYmLOiBSNWzKbNNq+mS6kJWgbktjK/sF+W+8=
X-Received: by 2002:a05:6a20:3ca2:b0:35b:b588:3002 with SMTP id adf61e73a8af0-363f5cef730mr5902876637.2.1764821240726;
        Wed, 03 Dec 2025 20:07:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG2UrzzkLrdjzuX2UlZcDTnPIcTqHvRtioevp/Qe7Vw3+4S5U2KAiHTDJrmu0ANkstk+HAGdQ==
X-Received: by 2002:a05:6a20:3ca2:b0:35b:b588:3002 with SMTP id adf61e73a8af0-363f5cef730mr5902840637.2.1764821240266;
        Wed, 03 Dec 2025 20:07:20 -0800 (PST)
Received: from hu-pkondeti-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7e29f2ecf6fsm527934b3a.11.2025.12.03.20.07.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 20:07:20 -0800 (PST)
Date: Thu, 4 Dec 2025 09:37:15 +0530
From: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
        Marc Zyngier <maz@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, rsalveti@oss.qualcomm.com
Subject: Alternative to arm64.nopauth cmdline for disabling Pointer
 Authentication
Message-ID: <3fcf6614-ee83-4a06-9024-83573b2e642e@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA0MDAzMCBTYWx0ZWRfX5e5fU3Ntdhgq
 MdTIEmUxnj0rJt6wBrxiR2CtYlz5/zt15WBvLb0sv22dI75lvlfVwkR2sONUWnFs8E1fIiA1qxO
 cDBhQRw3b6Jv+fPyRM57o2fAoFhT1M73GMc7T+AishKwVc0aTQWmhLZDjzP99AvxTdnZzReXpE7
 dkn0GWBHGcK/rk/AYm213lA7of/7WZAwCWE0Q68ZJ7p6/Zo+LfJ7s9HhP+M155zMXcmweanXRQH
 QKZXqKMQPAjCZ/LA/dou1uuJKcjG2T4o+KO13usjfqY4lasYq1RcUryzhjStbuVJi+tJyPysw0H
 vSWRq9gqx7QYCW8aLSJpdK55dw6irU6cJLcTAGHWPr53dNZDmlqL+cIDcSKnBzQ0ALcMVw/DXje
 bZ9hRhu+gx8s32qq+2Ci1EC5rC2Miw==
X-Authority-Analysis: v=2.4 cv=JY6xbEKV c=1 sm=1 tr=0 ts=693108fa cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=7CQSdrXTAAAA:8
 a=Yi-RDYHqs8T9QeDE7fwA:9 a=CjuIK1q_8ugA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: Xmh_8Dmp5RDk4ggPBoLmaFtuirLwgA7V
X-Proofpoint-ORIG-GUID: Xmh_8Dmp5RDk4ggPBoLmaFtuirLwgA7V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-04_01,2025-12-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 impostorscore=0 suspectscore=0 priorityscore=1501
 malwarescore=0 bulkscore=0 lowpriorityscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512040030
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251203_200724_545227_BA171F75 
X-CRM114-Status: GOOD (  16.59  )
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

Hi

The pointer authentication feature (PAuth) is only supported on
0-3 CPUs but it is not supported on 4-7 CPUS on QCS8300.
The ARM64 cpufeature discovery code expects late CPUs to have
this feature if boot CPU feature has it since PAuth is enabled
early. When a conflict like this is detected, the late CPUs are
not allowed to boot. It is expected that system will continue
to be functional with CPUs with Pauth feature supported and enabled.
This is not a desired behavior in production.

We started seeing this problem when Linux is booted in EL2. When Linux
is running under Gunyah (Type-1 hypervisor), Pointer Authentication
feature is hidden from EL1 via HCR_EL2.TID3. 

arm64.nopauth can be passed on kernel cmdline to disable the feature
in kernel so that all all CPUs can boot on QCS8300. I am told 
maintaining a custom kernel commandline per SoC in a Generic OS 
distribution is not recommended and asked to discuss the problem with
the comunity [1]

This patch [2] from Catalin adds a devicetree property under memory {}
to disable MTE. I believe this work predates the id-reg override
mechanism. However, this made me think if workarounds like this can be 
detected via devicetree, for example a property under cpu { } node.

Given that what we put in `chosen { bootargs="" }` kernel under
respective SoC devicetree can be overridden by bootloader, should we
have a **sticky** cmdline to specify critical workarounds like this?
This would be more generic than introducing any new parameters.

Looking for your inputs on this.

Thanks,
Pavan

[1] https://github.com/qualcomm-linux/meta-qcom/issues/1277
[2] https://lore.kernel.org/linux-arm-kernel/20200515171612.1020-24-catalin.marinas@arm.com/

