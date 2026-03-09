Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48739F3C255
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 13:28:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fnfugPh5B+LbknIiKQszfyisSyvY3KjBZqNzEIMIThI=; b=mvYrofyzkAfwlojwcvN94bfw1+
	kxxMlstdOFuZBxkm8fuAt7E1NPsC1zH3mvQB0Zy3NQOU2cIBfY8XdPYph9dkAKfntXVmV2FTtgo5K
	ZKYvq4Q/7D0w0dxhSXX9WgkIv6oLlVz/9Rx+crNNgCCMmPxHcvuqoacJwdIIO6eM2TYICiNV/LMys
	Te9L/eBsawpVla3URj3h/dXN4xGqmSUL8iELyMfnGnX2HlVVA21c/vW2DcJ4guWcZS+rRjvF1nKnB
	879N9ZjD1NLc0aZ7gwutH1g7Oj+pLDwTrhjiqV6q696wvJURAN3jDfYSxW7xuW0Ty8wOZq6iGtAnM
	sNkTpxhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzaf8-00000007OWm-3C3h;
	Mon, 09 Mar 2026 13:28:46 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzaf5-00000007OWN-2g2c
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Mar 2026 13:28:45 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62989wiZ2661187
	for <linux-arm-kernel@lists.infradead.org>; Mon, 9 Mar 2026 13:28:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fnfugPh5B+LbknIiKQszfyisSyvY3KjBZqNzEIMIThI=; b=FFD+a1v/aR3KoRdc
	Da2K/cGUixBiX2O9Xq4wA6Ke2vVqpLT97D6Hr0VJp1MHMTRGNVLc/t6Wfe3+J6E3
	iLuPef+qjEvTGklfkpDVlW5KHbhydyOd4rwbf7rPH2KlZzuG2+NolXCKcL8W8m7D
	1a2Da+Yk0nMmiwdLgTQ9+G46CV7VhCjp44JnK40gflSt0nuc2QowVq48oyJH3xCJ
	tnBrbebSmWJ48oRIg1rWmQJy9b8R9SS4rXXbv6iSSPLxPcuc4LxvesYnl23rRPI4
	kHDemytbuCYFUgwr8vQjrYOM99UifO1yBPnD5oOaYqB2uBVK6VF1CP2jOkrioo7O
	7YF76Q==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cr9cpnubm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Mar 2026 13:28:41 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-359822a4b39so3805162a91.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Mar 2026 06:28:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773062921; x=1773667721; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fnfugPh5B+LbknIiKQszfyisSyvY3KjBZqNzEIMIThI=;
        b=HAp7xtAUz+mkZErH6e1+mmudN+z4Xj+rg/3qh6p2xAiHQd7FjgnWh7CFDFqoKt8cp1
         66RROUGL4LXo+mz59qQT0tETc29tLOScpaeZZvHNTFcaZvz3B9C2Gyz1WhhlOgh5fXJH
         xls/IpAC4f5ZaqQJlaRb7n2tKfmv+ck+lmNMcat2dzpYVJpnQBCAGv9f9pB6CQxx2MFj
         QsJV5aYFX0Z79QmTUFu85HzzkBhr1Jg3EZnS2M6Aio7Tu5/o9YvoHspCuxGPQqXbod71
         suyiEpRrorYcXP0FctB7ouzallLyrnOUtmObm3K6taedavJ6yijsxkeAD1f6G8EKgrj3
         pr9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773062921; x=1773667721;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fnfugPh5B+LbknIiKQszfyisSyvY3KjBZqNzEIMIThI=;
        b=FmyWe9zpokTiAhSle9VAVN1rUPRISlAWmou/ZO3WF2rjMAaOTbdcBrIsH8yBqrrigv
         BYWO558LzFN8Q3gq99PS3TZZc6fRERKfB4JzPwGpI5dgZNApFTTmv7Ft+N1rvvbCFQkA
         bAXksFI6x5my5vuNM0ubG0nFf8auBmjkhQG32C6R22Jy9fYZBCwqERKtA+i3xbF84v6U
         8QPAsQBTDBNlcWH2at2M1TugOnhNdccnjxodXCzxrGuwCGBqjWTHs7KiGqimMe3O35Fb
         H8/ipMbwV731TnzGc4GUxVjY+PBR/ccKWPA7FNPoHLSFLYDsZARnnLDM67VoudZ8v13v
         ge/A==
X-Forwarded-Encrypted: i=1; AJvYcCWngY2mOI3vpx9Razt71OPA3xy138SrX39QzYyetlNxYnRPPqiAtYUT/uNqo8gsaZI4ZSR9FLMrwEgRPPu5rYPH@lists.infradead.org
X-Gm-Message-State: AOJu0Ywpf9RAx+xEnKdv2qY89pt0GAbIae2GH70eCRAWZ1gZxkeQeiF8
	Vpd90/oRz85PC0O2Kx7DA4PXCVmdF4UGkV9yWwEDR5Jzqnr2I85zIUZFI/asoeHRaqwRlU8akhB
	xgGeWaNUCQ14uhRRFptZ0UBYoOQ8ZmNJgkGNZmh4g/J4L9CNuLblMm12dmOummCwaQnVctewwRz
	hZyw==
X-Gm-Gg: ATEYQzwS0UmVj7WkhZWB74EXBBcbAJA+tmnK2S9AyAFJNRMebZ9EdZGOptBLuq9jePH
	6PnBNo9vLlhDDzfYdEYeE7Lok/qzRCrLuc6E1q3EsrVKtHnKDegdi3LCivrdWt19uXVv6gCQc3C
	lXys2Ny4bVQqpA0UwaUidYv7THqsI/QWHKGuPvpRcxnewYEKWi0a5/bI3/Jo9FNNuLSn/HTCk+F
	Mtj28bVGrstSSSr1jv+iguM44xcKtiDN0Rsj7vdO3Vww81o+Y71v2Me+ncu9mBRBugFLnSpWITC
	Wjr/+ErUbernkfqroWYl88xIOJI5CiJbtCJPF0AZ1vPrKoXHNwHvnwuVhD7vUGSPokwSIZafPR9
	JjDQfiD86vYJe06j+lddUmPs3uJggdhAObpmLRjuNLXYx60TuQtAPPRxC7FNCWIbeNUw1IX07TH
	ctdPZeOR1q
X-Received: by 2002:a17:90a:fc45:b0:359:8d95:4a57 with SMTP id 98e67ed59e1d1-359be352188mr7707198a91.6.1773062920819;
        Mon, 09 Mar 2026 06:28:40 -0700 (PDT)
X-Received: by 2002:a17:90a:fc45:b0:359:8d95:4a57 with SMTP id 98e67ed59e1d1-359be352188mr7707158a91.6.1773062920025;
        Mon, 09 Mar 2026 06:28:40 -0700 (PDT)
Received: from ?IPV6:2406:b400:b5:b794:54ad:c739:c526:34f4? ([2406:b400:b5:b794:54ad:c739:c526:34f4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359bc9bd61fsm5864869a91.3.2026.03.09.06.28.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Mar 2026 06:28:39 -0700 (PDT)
Message-ID: <edf7e7eb-8f02-4672-bc31-16e0a8fb9715@oss.qualcomm.com>
Date: Mon, 9 Mar 2026 18:58:29 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 00/16] Support Armv8 RAS Extensions for Kernel-first
 error handling
To: Ruidong Tian <tianruidong@linux.alibaba.com>, catalin.marinas@arm.com,
        will@kernel.org, lpieralisi@kernel.org, guohanjun@huawei.com,
        sudeep.holla@arm.com, rafael@kernel.org, robin.murphy@arm.com,
        mark.rutland@arm.com, tony.luck@intel.com, bp@alien8.de,
        tglx@linutronix.de, peterz@infradead.org
Cc: lenb@kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-acpi@vger.kernel.org,
        linux-perf-users@vger.kernel.org, linux-edac@vger.kernel.org,
        mchehab@kernel.org, xueshuai@linux.alibaba.com,
        zhuo.song@linux.alibaba.com, oliver.yang@linux.alibaba.com
References: <20260122094656.73399-1-tianruidong@linux.alibaba.com>
Content-Language: en-US
From: Umang Chheda <umang.chheda@oss.qualcomm.com>
In-Reply-To: <20260122094656.73399-1-tianruidong@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDEyMyBTYWx0ZWRfX9+XTsAlBdCGL
 L4vE05Q3HWbFzu9KzFdXMgAVdnnMt4EtQwt4G9iogFcDA9QGvl70NOzbBWCpaKRNcTiG5zGql7p
 NsS5uZo2pV2c69akeIk3Ub3J3LNi5KtHh4S3FgTa+drDs5GYUy91JMAqdgDH4Ep+wsg7BQuyrGi
 XfrxuvLysFhbNKR5fVrseLPPPV/d4HYmDR9CDGftlXWzUMSlS6lo5mltbgyfnkZhqDgnSeL1giR
 fSMxsdooLQQu3fp2hX5/kgwURtWYqBFoLi/DeVPgGJTrnuGF7xQkqg8CWzImJ4W83zMS1GDIMlb
 zBrtc4nrZUyhX2pFacsFo7g7n1u42biGULKtEkCQ0U45iaI890Za9/IkLSHd2HSp3NxhEpndChO
 ZJmXehNDL9otiXDe+idxpeX1am/71hcHvHay/396TDrYknENrtrTxuUjQd1OZdZXA46Fnf8iQTR
 wZhkGdNzdcmJaYJ947A==
X-Proofpoint-ORIG-GUID: psJXWBNbMAKGjbgUed1SPdMjWwnVY3zO
X-Proofpoint-GUID: psJXWBNbMAKGjbgUed1SPdMjWwnVY3zO
X-Authority-Analysis: v=2.4 cv=e7sLiKp/ c=1 sm=1 tr=0 ts=69aecb0a cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=7CQSdrXTAAAA:8
 a=VwQbUJbxAAAA:8 a=zd2uoN0lAAAA:8 a=vzhER2c_AAAA:8 a=SRrdq9N9AAAA:8
 a=NEAV23lmAAAA:8 a=QyXUC8HyAAAA:8 a=cpMiU1yUC2MWLmdqKLoA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22 a=a-qgeE7W1pNrGK8U0ZQC:22
 a=0YTRHmU2iG2pZC6F1fw2:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_03,2026-03-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 suspectscore=0 spamscore=0 bulkscore=0 impostorscore=0 malwarescore=0
 clxscore=1011 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603090123
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_062843_837876_FFFFAB7D 
X-CRM114-Status: GOOD (  35.36  )
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

Hello Ruidong Tain,

On 1/22/2026 3:16 PM, Ruidong Tian wrote:
> Motivation: Reliability in Modern Data Centers
> =================================================
> In modern data centers, proactive maintenance is essential for achieving high
> service availability. The practice of using Corrected Errors (CE) to predict
> impending Uncorrected Errors (UE) is already widely deployed at scale across
> the industry, like Alibaba[2], Tencent[4], Intel[1], AMD[2]. By analyzing CE
> telemetry, operators can identify failing hardware and perform migrations
> before catastrophic failures occur.
>
> Problem: Inefficient CE Collection on ARM
> ==========================================
> Currently, ARM-based systems primarily rely on "Firmware-First" error
> handling (e.g., via GHES). This path is inherently heavy-weight. To avoid
> significant performance overhead, firmware is often configured with high
> thresholds—reporting to the OS only after thousands of CEs have occurred.
> If the threshold is set lower, the high frequency of errors leads to
> excessive and costly context switching between the OS and firmware.
> Consequently, ARM platforms currently lack an efficient mechanism to collect
> the granular CE data required for high-fidelity error prediction.
>
> Solution: Kernel-First Handling via AEST
> ===========================================
> Other architectures have long utilized "Kernel-First" approaches for
> efficient CE collection: Intel provides CMCI (Corrected Machine Check
> Interrupt), and AMD has recently introduced similar CE interrupt support[5].
>
> On the ARM architecture, hardware already provides the necessary RAS
> Extensions[6], and the ACPI AEST specification[0] defines a standardized way for
> the OS to discover these error source registers. This series implements
> AEST support, enabling the kernel to:
>
>  - Discover error sources directly via ACPI tables.
>  - Handle CE notifications via direct interrupts.
>  - Bypass firmware overhead to collect every CE or use low-latency thresholds.
>
> This implementation provides the missing link for efficient RAS telemetry
> on ARM, bringing it to parity with other enterprise architectures.

Thanks for posting this series enabling kernel-first handling for the Armv8 RAS extensions.

We noticed the current implementation targets ACPI-based server platforms. For embedded/SoC systems, Device Tree is often the primary firmware description. 
Do you have any plans to add DT-based support for the same flow? If not, do you see any blockers to extending this series to support DT 
(e.g., DT bindings + discovery/registration path analogous to the ACPI plumbing) ? 
If DT support is in-scope, We would be happy to align on the expected approach and help with review/development/testing for DT-based platforms.

> Background and Maintenance
> =============================
> This series is based on Tyler Baicar's preliminary patches [7]. I attempted
> to follow up with Tyler in 2022 [8] but received no reply. As he no longer
> appears active on the mailing list, I have picked up this work, updated it
> to align with the latest AEST v2.0 specification, and addressed pending
> feedback to ensure this critical feature is integrated into the mainline.
>
> AEST Driver Architecture
> ========================
>
> The AEST driver is structured into three primary components:
>   - AEST device: Responsible for handling interrupts, managing the lifecycle
>                  of AEST nodes, and processing error records.
>   - AEST node: Corresponds directly to a RAS node in the hardware
>   - AEST record: Represents a set of RAS registers associated with a specific
>                  error source.
>
> Comparison with x86 MCA:
>
> RAS record ≈ MCA bank.
> RAS node ≈ A set of MCA banks + CMCI on a core.
>
> The key difference lies in uncore handling: x86 typically maps uncore errors
> (like those from a memory controller) into core-based MCA banks. In contrast,
> ARM requires uncore components to provide their own standalone RAS nodes. When
> a component requires multiple such nodes, they are grouped and managed as a
> "RAS device" in AEST driver. 
>
> These components are organized hierarchically as follows:
>
>  ┌──────────────────────────────────────────────────┐
>  │             AEST Driver Device Management        │
>  │┌─────────────┐    ┌──────────┐     ┌───────────┐ │
>  ││ AEST Device ├─┬─►│AEST Node ├──┬─►│AEST Record│ │
>  │└─────────────┘ │  └──────────┘  │  └───────────┘ │
>  │                │       .        │  ┌───────────┐ │
>  │                │       .        ├─►│AEST Record│ │
>  │                │       .        │  └───────────┘ │
>  │                │  ┌──────────┐  │        .       │
>  │                ├─►│AEST Node │  │        .       │
>  │                │  └──────────┘  │        .       │
>  │                │                │  ┌───────────┐ │
>  │                │  ┌──────────┐  └─►│AEST Record│ │
>  │                └─►│AEST Node │     └───────────┘ │
>  │                   └──────────┘                   │
>  └──────────────────────────────────────────────────┘
>
> AEST Interrupt Handle
> =====================
>
> Upon an AEST interrupt, the driver performs the following sequence:
> 1. The AEST device iterates through all registered AEST nodes to identify the
>    specific node(s) and record(s) that reported an error.
> 2. Each node typically contains two types of records:
>       - report record: Errors can be located efficiently through a bitmap
>                        in the `ERRGSR` register.
>       - poll record: The node must individually poll all records to determine
>                      if an error has occurred.
> 3. process record:
>       - if error is corrected, The CE threshold is reset, and the error event
>         is logged.
>       - if error is defered, Relevant registers are dumped, and
>         `memory_failure()` is invoked.
>       - if error is uncorrected, panic, While UEs typically trigger an
>         exception rather than an interrupt, if detected, the system will panic.
> 4. decode record: The AEST driver notifies other relevant drivers, such as
>    EDAC, to further decode the reported RAS register information.
>
> Testing
> ===================
> I have tested this series on THead Yitian710 SOC with customized BIOS. Someone
> can also use QEMU[9] for preliminary driver testing.
>
> 1. Boot Qemu
>
> qemu-system-aarch64 -smp 4 -m 32G \
>   -cpu host --enable-kvm -machine virt,gic-version=3 \
>   -kernel Image -initrd initrd.cpio.gz \
>   -device virtio-net-pci,netdev=t0 -netdev user,id=t0 \
>   -bios /usr/share/edk2/aarch64/QEMU_EFI.fd  \
>   -append "rdinit=/sbin/init earlycon verbose debug console=ttyAMA0 aest.dyndbg='+pt'" \
>   -nographic -d guest_errors -D qemu.log
>
> 2. inject error
> devmem 0x90d0808 l 0xc4800390
>
> 2.1 Memory error
> [   64.959849] AEST: {1}[Hardware Error]: Hardware error from AEST memory.90d0000
> [   64.959852] AEST: {1}[Hardware Error]:  Error from memory at SRAT proximity domain 0x0
> [   64.959855] AEST: {1}[Hardware Error]:   ERR0FR: 0x40000080044081
> [   64.959858] AEST: {1}[Hardware Error]:   ERR0CTRL: 0x108
> [   64.959859] AEST: {1}[Hardware Error]:   ERR0STATUS: 0xc4800390
> [   64.959860] AEST: {1}[Hardware Error]:   ERR0ADDR: 0x8400000043344521
> [   64.959861] AEST: {1}[Hardware Error]:   ERR0MISC0: 0x7fff00000000
> [   64.959861] AEST: {1}[Hardware Error]:   ERR0MISC1: 0x0
> [   64.959862] AEST: {1}[Hardware Error]:   ERR0MISC2: 0x0
> [   64.959863] AEST: {1}[Hardware Error]:   ERR0MISC3: 0x0
> [   64.959873] Memory failure: 0x43344: recovery action for free buddy page: Recovered
>
> 2.2 CMN error
> [  132.044283] AEST: {2}[Hardware Error]: Hardware error from AEST XP
> [  132.044286] AEST: {2}[Hardware Error]:  Error from vendor hid ARMHC700 uid 0x0
> [  132.044288] AEST: {2}[Hardware Error]:   ERR0FR: 0x48a5
> [  132.044290] AEST: {2}[Hardware Error]:   ERR0CTRL: 0x108
> [  132.044292] AEST: {2}[Hardware Error]:   ERR0STATUS: 0xc4800390
> [  132.044293] AEST: {2}[Hardware Error]:   ERR0ADDR: 0x8400000043344521
> [  132.044295] AEST: {2}[Hardware Error]:   ERR0MISC0: 0x0
> [  132.044296] AEST: {2}[Hardware Error]:   ERR0MISC1: 0x0
> [  132.044298] AEST: {2}[Hardware Error]:   ERR0MISC2: 0x0
> [  132.044299] AEST: {2}[Hardware Error]:   ERR0MISC3: 0x0
> [  132.044302] Memory failure: 0x43344: recovery action for already poisoned page: Failed
>
> [0]: https://developer.arm.com/documentation/den0085/0200/
> [1]: Intel: Predicting Uncorrectable Memory Errors from the Correctable Error History
> [2]: Alibaba. Predicting DRAM-Caused Risky VMs in Large-Scale Clouds. Published in HPCA2025
> [3]: AMD: Physics-informed machinelearning for dram error modeling
> [4]: Tencent: Predicting uncorrectablememory errors for proactive replacement: An empirical study on large-scale field data
> [5]: https://lore.kernel.org/all/20251104-wip-mca-updates-v8-4-66c8eacf67b9@amd.com/
> [6]: https://developer.arm.com/documentation/ihi0100/
> [7]: https://lore.kernel.org/all/20211124170708.3874-1-baicar@os.amperecomputing.com/
> [8]: https://lore.kernel.org/all/b365db02-b28c-1b22-2e87-c011cef848e2@linux.alibaba.com/
> [9]: https://github.com/winterddd/qemu/tree/error_record
>
> Change from V5:
> https://lore.kernel.org/all/20251230090945.43969-1-tianruidong@linux.alibaba.com/
> 1. Based on the feedback from Borislav Petkov, I've dropped the idea of a 
>    unified address translation interface across ARM and AMD.
>
> Change from V4:
> https://lore.kernel.org/all/20251222094351.38792-1-tianruidong@linux.alibaba.com/
> 1. Fix build warning in 0010 and 0014 report by kernel test robot:
>     https://lore.kernel.org/all/202512230122.CfXZcF76-lkp@intel.com/
>     https://lore.kernel.org/all/202512230007.Vs6IvFVD-lkp@intel.com/
> 2. Dropped the extra patch(0014) that was mistakenly included in v4.
>
> Change from V3:
> https://lore.kernel.org/all/20250115084228.107573-1-tianruidong@linux.alibaba.com/
> 1. Add vendor AEST node framework and support CMN700
> 2. Borislav Petkov
>     - Split into multiple smaller patches for easier review.
>     - refined the English in the cover letter for better flow.
> 3. Accept Tomohiro Misono's comment
>
> Change from V2:
> https://lore.kernel.org/all/20240321025317.114621-1-tianruidong@linux.alibaba.com/
> 1. Tomohiro Misono
>     - dump register before panic
> 2. Baolin Wang & Shuai Xue: accept all comment.
> 3. Support AEST V2.
>
> Change from V1:
> https://lore.kernel.org/all/20240304111517.33001-1-tianruidong@linux.alibaba.com/
> 1. Marc Zyngier
>   - Use readq/writeq_relaxed instead of readq/writeq for MMIO address.
>   - Add sync for system register operation.
>   - Use irq_is_percpu_devid() helper to identify a per-CPU interrupt.
>   - Other fix.
> 2. Set RAS CE threshold in AEST driver.
> 3. Enable RAS interrupt explicitly in driver.
> 4. UER and UEO trigger memory_failure other than panic.
>
> Ruidong Tian (16):
>   ACPI/AEST: Parse the AEST table
>   ras: AEST: Add probe/remove for AEST driver
>   ras: AEST: support different group format
>   ras: AEST: Unify the read/write interface for system and MMIO register
>   ras: AEST: Probe RAS system architecture version
>   ras: AEST: Support RAS Common Fault Injection Model Extension
>   ras: AEST: Support CE threshold of error record
>   ras: AEST: Enable and register IRQs
>   ras: AEST: Add cpuhp callback
>   ras: AEST: Introduce AEST driver sysfs interface
>   ras: AEST: Add error count tracking and debugfs interface
>   ras: AEST: Allow configuring CE threshold via debugfs
>   ras: AEST: Introduce AEST inject interface to test AEST driver
>   ras: AEST: Add framework to process AEST vendor node
>   ras: AEST: support vendor node CMN700
>   trace, ras: add ARM RAS extension trace event
>
>  Documentation/ABI/testing/debugfs-aest |   99 +++
>  MAINTAINERS                            |   11 +
>  arch/arm64/include/asm/arm-cmn.h       |   47 ++
>  arch/arm64/include/asm/ras.h           |   95 +++
>  drivers/acpi/arm64/Kconfig             |   11 +
>  drivers/acpi/arm64/Makefile            |    1 +
>  drivers/acpi/arm64/aest.c              |  311 +++++++
>  drivers/perf/arm-cmn.c                 |   37 +-
>  drivers/ras/Kconfig                    |    1 +
>  drivers/ras/Makefile                   |    1 +
>  drivers/ras/aest/Kconfig               |   17 +
>  drivers/ras/aest/Makefile              |    8 +
>  drivers/ras/aest/aest-cmn.c            |  330 ++++++++
>  drivers/ras/aest/aest-core.c           | 1054 ++++++++++++++++++++++++
>  drivers/ras/aest/aest-inject.c         |  131 +++
>  drivers/ras/aest/aest-sysfs.c          |  228 +++++
>  drivers/ras/aest/aest.h                |  410 +++++++++
>  drivers/ras/ras.c                      |    3 +
>  include/linux/acpi_aest.h              |   75 ++
>  include/linux/cpuhotplug.h             |    1 +
>  include/linux/ras.h                    |    8 +
>  include/ras/ras_event.h                |   71 ++
>  22 files changed, 2914 insertions(+), 36 deletions(-)
>  create mode 100644 Documentation/ABI/testing/debugfs-aest
>  create mode 100644 arch/arm64/include/asm/arm-cmn.h
>  create mode 100644 arch/arm64/include/asm/ras.h
>  create mode 100644 drivers/acpi/arm64/aest.c
>  create mode 100644 drivers/ras/aest/Kconfig
>  create mode 100644 drivers/ras/aest/Makefile
>  create mode 100644 drivers/ras/aest/aest-cmn.c
>  create mode 100644 drivers/ras/aest/aest-core.c
>  create mode 100644 drivers/ras/aest/aest-inject.c
>  create mode 100644 drivers/ras/aest/aest-sysfs.c
>  create mode 100644 drivers/ras/aest/aest.h
>  create mode 100644 include/linux/acpi_aest.h


Thanks,
Umang


