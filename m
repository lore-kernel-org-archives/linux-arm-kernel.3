Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27B3CC55184
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 13:36:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wPVtlc2R+2Upsh/zi7w5XwcxW3YvgvKP3t2ZGw8e60s=; b=Dc4cBe/2eJ/uPyINZE23PM+QDB
	EWVbK6Ne5YZnzGY3OBdCMnFtoOyaqRd2BdVUzmkKCcSoc3nhJ8qlugMVPqYoQb8yh9htFSA5gdrtl
	3b7Pmy24G1+CyMVeLAFDkILiZaXxz6eQblqGLdi2WuX6nLoxwqxeUbT1hEKYVQQBmuJYmSBpfpVEw
	kr1aYNH2HeCkaiwEmNN+6p/VXbUD/ErJLktBarCeb44gSK6HbKEIYecXFZVnmkjhHidflFqfrKXtJ
	TIIizq+iQfY29nCivRPSDQ6ahlkXKWyKBSywAKS7ZFpSQsOZ9v5B6Kk2zBSBb9Q8j+5GySUbAJR07
	RSI/HQZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrFJl-00000001wEI-0M4A;
	Tue, 04 Aug 2026 13:36:29 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrFJg-00000001wDE-1iC9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 13:36:26 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 674CXtsC3896351
	for <linux-arm-kernel@lists.infradead.org>; Tue, 4 Aug 2026 13:36:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wPVtlc2R+2Upsh/zi7w5XwcxW3YvgvKP3t2ZGw8e60s=; b=hpMkr4k9JpwdnUSK
	fFBYb4Uq+8xC80GkVJ2Dn9R80ptHdD/4E0iigdXRfEt+SLbSDW51/yWirDUoGgVg
	S7EMQC6+3SsDyhDFWSe8GNp6kG2l78MHi5kgZ6xg75uGksYa+lLrU/7Wr3YnDe4Z
	g3dkYPR1TG0ot+5uxa72Cm+WBagq2BuyDNYCA4Kul4wWZ9zmKssqQLHyC+Grfxlj
	luS+X2Uf0GGNHEFESHxYm1x4xew3pWJfNIDlJHVaEQ3jIqOb5sYrybWRGaI9jWvm
	Zy1AWCB0ZkfgvBA0LBY3McztEzNRczqAlpvTalSIRns8BAodX+/btPBr147kVzww
	yhrmUA==
Received: from mail-yx1-f69.google.com (mail-yx1-f69.google.com [74.125.224.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fu1p8bu50-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Aug 2026 13:36:22 +0000 (GMT)
Received: by mail-yx1-f69.google.com with SMTP id 956f58d0204a3-667656a12c5so1674841d50.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Aug 2026 06:36:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785850582; x=1786455382; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wPVtlc2R+2Upsh/zi7w5XwcxW3YvgvKP3t2ZGw8e60s=;
        b=cJ4mfpVBTMvlo3FKBCGvXyppRiDjX+KDIFS4kodxr0aE1aaWCd9qRboaB+ed3aZjpS
         avy0MUV3ttZdWFk7Bw930w77tj0NlRvtJ+JCP++gc56z0AO5ilUOQV6kkBvQkKCKDnR/
         RQGrEgvNlbpFlozDCoAHDujJecLIyPa6ucqVMhhsDF6Hwlhy2xnMRkGwXD3bmCvLDl2t
         3I7ChgGktXxinCjDx9di6WURdigFNN+EbipwbTNhXzO0906dqquN0Z2SHEFsMEm+OqZ7
         1U7j3eVeqInXTHxba3DH1uYYYMkF94FhsSRL5kyxnmcrLCLfsc0ARCyTB64ZBDfXR7K4
         YjnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785850582; x=1786455382;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wPVtlc2R+2Upsh/zi7w5XwcxW3YvgvKP3t2ZGw8e60s=;
        b=suBC2MzkW28VuzndSp66Id+baNLy1SiTCZWyZ8qmwQ2ImGcVQFmTJP3zygYS0KOlCB
         Te9JD281oteUyNciQMAWxnaRv5UotCjgqR3ltRrds6PxJGRgjKYZjK0ygemL6nNhBO+N
         nIGDCVanXSY3eLOD3eyBiuiv1DpaogCzHRh2EtzoQDGe8CadDFZuEddjDB6Z072O01CM
         deyjknh59jA3h4e6YNd7ZbLm7x18BwWTmeiKrd8dVLRxXOWMR8NcfYWcRNmhTLlJsm7g
         AUC2PZD1O6NI3Bsu3DIf+aZ9pm6H4eNRR9y1ztGTF4sJiV2KPkh/iP2KEz1ahNOh/X+8
         1rDA==
X-Forwarded-Encrypted: i=1; AHgh+RqSFIr8qJ4lGRF/9J4jULBbyrKYRBqvqjutAw/5U2xQzG4e+Rqt5Ck55CUeYT6m7aMqfyfTHZFWkTPT3odsuZwR@lists.infradead.org
X-Gm-Message-State: AOJu0Yyfw4iRaG5d31y2K/nfUqZZhMyVxvyqnqDq1teXIiE16N/Knl/7
	1pOOBUNsnVXjM4Ef76XW0xIC2JARRjfLqNiH0+7oUQA88HgbXxpmh8I2sZx9fURY2RaCRefHeOg
	/WHPjcVt7b4nK6j1elWqdCQBWtk1TU8WfJIGDtYMhUph/DfLjoyZ1i+KLqWu9wHLnyc1rO8dfw/
	3QdQ==
X-Gm-Gg: AR+sD135jT48t4yZ5wJ/uznyH1xCK4ShJ2EymOv6Agswk50GOrF/Cz6UVFViqNqfiwl
	pPMZCSC78RWGqXpBaH5FyOM4dl/IFg7waWMlAooj1U0xcK62ltDqkZbkSpv6si7+7nd/9gOV6hL
	9A/yCU/ynbLB2FRp4gDIZdqpAGx9CNUYirrkJ5OOpKX0ie8DSYqtH+tOygqjLvWGJJtn7b9Dk2M
	vGFHwblGNjZcAPU9KskwRp4VTGPZvhaHVLrfNgNqqZPzXPaGCNszMzkJ2LJ1dfmAeSwWB/tq2m7
	HiDodcpi6S2WM+mQI+YbM80nd/lCrMsmEok77cjyVDImQN+Smuyvlv0PId2vHGYSHHVRBTpuKoT
	irniRNOtdaXdUKKZQ+JuUQHMHK2qLCjCu
X-Received: by 2002:a05:690e:4093:b0:667:e04a:8a30 with SMTP id 956f58d0204a3-6694f10bb1dmr17200040d50.20.1785850581560;
        Tue, 04 Aug 2026 06:36:21 -0700 (PDT)
X-Received: by 2002:a05:690e:4093:b0:667:e04a:8a30 with SMTP id 956f58d0204a3-6694f10bb1dmr17200007d50.20.1785850581024;
        Tue, 04 Aug 2026 06:36:21 -0700 (PDT)
Received: from [192.168.1.106] ([106.51.192.47])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6699163b8fasm641462d50.16.2026.08.04.06.36.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Aug 2026 06:36:20 -0700 (PDT)
Message-ID: <34c53495-f687-4de7-951e-f483488244b0@oss.qualcomm.com>
Date: Tue, 4 Aug 2026 19:06:08 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 00/11] arm_mpam: Add MPAM-Fb firmware support
To: Andre Przywara <andre.przywara@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Hanjun Guo
 <guohanjun@huawei.com>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
        James Morse <james.morse@arm.com>, Ben Horgan <ben.horgan@arm.com>,
        Reinette Chatre <reinette.chatre@intel.com>,
        Fenghua Yu <fenghuay@nvidia.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
        Ganapatrao Kulkarni <ganapatrao.kulkarni@oss.qualcomm.com>,
        Trilok Soni <tsoni@quicinc.com>,
        Srinivas Ramana <sramana@qti.qualcomm.com>,
        Niyas Sait <niyas.sait@arm.com>, Lee Trager <lee@trager.us>,
        Ritwick Sharma <ritwick.sharma@arm.com>, Gavin Shan <gshan@redhat.com>,
        linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20260804100627.3217149-1-andre.przywara@arm.com>
 <5d7433ff-f6e4-42cc-bc8a-08179b3d136b@arm.com>
Content-Language: en-US
From: Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>
In-Reply-To: <5d7433ff-f6e4-42cc-bc8a-08179b3d136b@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=A5xc+aWG c=1 sm=1 tr=0 ts=6a71ead6 cx=c_pps
 a=J+5FMm3BkXb42VdG8aMU9w==:117 a=ugN4vXIPUBCZxoiA0ovN8A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=Xqa8mw1O4si3QOZM5SEA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=Epx66wHExT0cjJnnR-oj:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDEwOSBTYWx0ZWRfX9pQReUp4UzjC
 BTeug5JHlj6HN2xq8u4DNHDXgCpMNG296UQYJMkNkrl5SygLbRKQyBNTzWLSZNUNnEFVvYzveaB
 gAaqxaqpASGsPM95pX1OGtEmm1+L+vNKG7b6W2GmCT+3scZPmwuZeYlDOR3Q9TK/S9aZcqQf/kk
 HBKjC8FQ6Vmfwu1hiec2H0XCEYIWCSA55TXmJa2mXiPku+6m2xUaZ7monbosOEnlZ8UpHKrVDVu
 CTL9+Ovq0iDlhpYMUDMUyk7YBhU5r9KHBIWELprYQeJoNCigfBqUzszxCEDZgAW10AHidJWDoji
 0tv3lzQiNxSnhAfo42blwFFXb3OupxokKxlZ30Ud0ph559c5Cat2BfO2b3+IMymNJ9KMr58ymWC
 Ng4vl/NTQMrTSpRN46eerVZGIP4QKS7tWMibhReL9lYAGWGOv+izGz6cCNNm+DYefkodKYormJe
 IGfQqZ1pkj9P/+liISw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDEwOSBTYWx0ZWRfX1xQf7T2PC1qK
 2oC65X/Iotckh3NX10u3GaV/0E0hMSt6iXxGb4lidK2rAa69oISW1HdoTrntPjSAXufnPmNmig6
 nVfnqCb9O9PEB88ARCqbe6OTtJa9qPA=
X-Proofpoint-ORIG-GUID: FgT2SFYEgym1bWi9TRqx2Nq2YkZ1rJ6O
X-Proofpoint-GUID: FgT2SFYEgym1bWi9TRqx2Nq2YkZ1rJ6O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_03,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 suspectscore=0 adultscore=0 bulkscore=0 spamscore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608040109
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_063624_568936_9C34476C 
X-CRM114-Status: GOOD (  51.19  )
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


Hi Andre,

On 8/4/2026 5:58 PM, Andre Przywara wrote:
> Hi,
> 
> On 8/4/26 12:06, Andre Przywara wrote:
>> this is v8 of the MPAM-Fb code, for firmware based MSC accesses.
>> It fixes a potential use-after-free of the dev pointer on error
>> prints, and disables the IRQ on the irqchip side in case doing it on
>> the device side doesn't work. The rest are cosmetic fixes and adding
>> the tags from the diligent reviewers and testers, many thanks for that!
>> I dropped tags from the error IRQ patch (10/11) due to changes.
>> Find the changelog below. Based on v7.2-rc1.
>>
>> =======================
>> The Arm MPAM specification defines Memory System Components (MSCs),
>> which are devices that are programmed through an MMIO register frame. In
>> some occasions this turned out to be too limiting: the MSC might be
>> located behind a separate bus system (for instance inside an on-board
>> controller), it might be mapped secure-only, or in a different processor
>> socket without direct MMIO mapping. Also the MMIO access might be too 
>> slow
>> or it would need to be filtered or otherwise access controlled. Finally
>> there might be bugs in the MSC integration, which require a mediating
>> firmware to be accessible.
> 
> 
> For the records, I looked at the sashiko complaints, by my analysis most 
> comments fall into one of those categories:
> 
> - Does this new early return / error return .... break MPAM logic?
> It's concerned about just bailing out from the middle of a sequence of 
> MPAM read or writes, leaving the MSC in a misconfigured state. This is 
> true, but doesn't apply, because we tear down MPAM completely upon an 
> MPAM-Fb access returning an error. And if the communication between the 
> kernel and an MSC breaks down completely, there isn't much we can do 
> anyway: attempts to recover would fail as well.
> 
> - Since xxx() now returns an error code, do the callers need
>    to be updated to check it?
> - Are there missing error checks in xxx() related to the new error
>    return values?
> Yes, this is done in one of the following patches. The series is 
> constructed so that only the final patch enables MPAM-Fb, before that 
> there is no way MPAM-Fb could be instantiated, so only MMIO accesses are 
> happening. They always return 0, so no error could occur and error paths 
> are never exercised.
> This is used to construct the functionality gradually, and allow 
> multiple, but smaller patches. Mentioned in the cover letter.
> 
> - This is a pre-existing issue, but ....
> I haven't checked in detail, but from previous rounds those concerns 
> were addressed by Ben's fixes, which IIUC are on its way already. This 
> series is based on v7.2-rc1, so those fixes are not applied here.
> 
> Hope that helps,
> Cheers,
> Andre
> 
>> To accommodate all those different use cases, the MPAM-Fb specification
>> [1] describes an alternative way to access MSCs. Accesses to an MSC
>> would be wrapped in a message and communicated to the system using a
>> shared-memory/mailbox system mostly mimicking the Arm SCMI spec.
>> For ACPI systems, this would be abstracted through an ACPI PCC channel,
>> which provides the shared-memory region and the mailbox trigger. We can
>> lean on existing ACPI parsing code to register with these two
>> subsystems, but cannot rely on the existing SCMI code in the kernel.
>> This means we somewhat need to open code a very simplified SCMI handler,
>> which just provides enough functionality for the very basic subset of
>> SCMI that the MPAM-Fb spec requires.
>>
>> The first seven patches rework all MSC access wrappers to propagate error
>> information. Pure MMIO based MSC accesses would never fail, but the
>> MPAM-Fb access can go wrong in multiple ways. The patches have been split
>> up purely for reviewing reasons, if the number is a problem, we could as
>> well squash them. Please note that until the very last patch of this 
>> series
>> any MSC accesses would always only return 0, it's only the final 
>> enablement
>> of MPAM-Fb that could possibly introduce errors. Hence all former patches
>> can add error handling gradually, those code paths wouldn't be triggered
>> before patch 11/11.
>> Patch 8/11 solves a nasty problem: At the moment we protect stateful MSC
>> register accesses (mon_sel) through a spinlock. Unfortunately the mailbox
>> subsystem and the slow nature of the communication through this channel
>> forbid MPAM-Fb access in atomic context. So this patch keeps using a
>> spinlock for MMIO based accesses, but reverts to a mutex otherwise.
>> We just deny taking the lock for MPAM-Fb in atomic context, ideally we
>> wouldn't need that (no need to IPI another core when the MSC access does
>> not need to be local to one particular core), or we simply deny that part
>> of the functionality (access through perf).
>> Patch 9/11 adds the code to redirect MSC accesses through the
>> PCC shmem/mailbox system.
>> Patch 10/11 reworks the error interrupt handler to use a threaded IRQ for
>> MPAM-Fb, to be able to do MPAM-Fb MSC accesses inside (which might 
>> sleep).
>> The final patch 11/11 then adds the code to detect and store the PCC
>> channel information from the ACPI tables, and eventually enables
>> MPAM-Fb accesses.
>>
>> This would enable systems where some MSCs are not accessible via MMIO to
>> use those components anyway.
>>
>> Please have a look and test!
>>
>> Cheers,
>> Andre
>>
>> [1] https://developer.arm.com/documentation/den0144/latest
>>
>> Changes in v8:
>> - disable error IRQ on irqchip level when device side fails
>> - use MSC dev pointer for dev_err() instead of mailbox one
>> - smaller white space and formatting fixes
>> - reorder MPAM-Fb definitions
>> - rename error translation function to mpam_fb_to_linux_errno()
>> - add review and test tags
>>
>> Changes in v7:
>> - add tags
>> - add new patch to propagate errors in mpam_reprogram_ris_partid()
>> - prevent loop when mpam_diable() tries MSC accesses again
>> - register MMIO error IRQ handler without IRQF_ONESHOT
>> - re-use existing "err" variable instead of declaring "ret"
>> - initialise mon_sel_lock later, to wait for interface decision
>> - convert timeout units for nominal latency, between us and ms
>> Changes in v6:
>> - keep using hard IRQ handler for MMIO based accesses
>> - move shmem buffer size and MPAM-Fb version check into mpam_fb.c
>> - drop mutex guard in mpam_fb_send_request(), we use gotos anyway
>> - factor out MPAM-Fb protocol error translation
>> - add MPAM_FB_ERR_BUSY error code to translation
>> - explicitly report also MPAM-Fb protocol error number when disabling 
>> MPAM
>> - remove unneeded MPAM-Fb details from mpam_internal.h
>> - drop leftover mpam_fb_msc_id usage
>>
>> Changes in v5:
>> - do not initialise _high variables early
>> - fix whitespace issues
>> - add Jonathan's Reviewed-by: tags
>> - init only either the spinlock OR the mutex for the mon_sel_lock
>> - drop warning about mapped_hwpage_sz for MPAM-Fb in 
>> mpam_msc_zero_mbwu_l()
>> - change IRQ handler to threaded handler, to allow MPAM-Fb MSC accesses
>> - disallow per-CPU IRQs (PPIs) for MPAM-Fb
>> - trigger MPAM disabling on MPAM-Fb protocol errors
>> - fix MPAM_PROTOCOL_VERSION_CMD name
>> - use PCC driver defined symbol for PCC_CHAN_FLAGS_IRQ
>> - add comment about usage of PCC's .signature field
>> - check for illegal MPAM-Fb command before sending request
>> - drop CPU accessibility check for MPAM-Fb based MSC accesses
>> - move MPAM-Fb protocol message structs inside build functions
>> - add comment about largest message size
>> - drop extra msc->mpam_fb_msc_id, in favour using pdev->id
>> - use already defined local dev variable instead of &pdev->dev
>> - use FIELD_GET() macro for MPAM-Fb protocol check
>> - drop devm_mutex_init() for pcc_chan_lock
>>
>> Changes in v4:
>> - unify error check patterns
>> - use scoped_guard(mutex) and ACQUIRE to simplify error handling
>> - use struct kref for PCC channel refcount
>> - drop unused mailbox rx_callback function
>> - increase size of props[] array to hold new msc_id property
>> - set mailbox TX timeout based on ACPI MPAM table field
>> - use devm_mutex_init() to allow automatic cleanup
>> - avoid overwriting error value for arm,not-ready-us property read
>> - prune MPAM-Fb protocol token to fit into bitmask inside register
>> - check return value for AIDR read
>> - use two separate MPAM-Fb protocol payload structs
>> - prune header list for mpam_fb.c
>> - drop "nrdy handled as an error" change
>> - fix message size field in MPAM-Fb protocol shmem area
>> - drop message size return from MPAM-Fb message build functions
>> - bring back IRQ flag in MPAM-Fb protocol header
>>
>> Changes in v3:
>> - drop inner/outer mon_sel lock patch, replace with simpler version
>> - harmonise code patterns in error propagation changes
>> - drop mon_sel lock before erroring out in mpam_ris_hw_probe_csu_nrdy()
>> - refactor mpam_msc_read_mbwu_l() to return an error
>> - drop special NRDY handling in __ris_msmon_read()
>> - add IRQ numbers in error interrupt handler to help pinpoint failure
>> - refactor MPAM-Fb message generation to accommodate more than read/write
>> - check MPAM-Fb protocol version at probe time
>> - drop mpam_fb.h header, merge into mpam_internal.h
>> - translate MPAM-Fb error code in Linux codes where needed
>> - clear IRQ flag bit in MPAM-Fb protocol header
>> - drop unneeded endianness conversions when crafting MPAM-Fb message
>> - use C struct to model MPAM-Fb message payload
>>
>> Changes in v2:
>> - add patches to add error propagation to MSC access wrappers
>> - drop former patch 1/5 (not needed)
>> - drop lock in mpam_reprogram_msc(), to avoid double lock
>> - add support for multiple MSCs per PCC channel
>> - adjust SCMI protocol code to use a PCC subtype 3 channel
>> - let PCC code handle the PCC channel negotiation (due to subtype 3)
>> - drop SCMI names in shmem offsets, and use existing PCC type 3 struct
>> - adjust shmem field offsets to match MPAM-Fb spec, not pure SCMI
>> - prevent MPAM-Fb calls inside atomic smp_call_function_any() payload
>> - skip all MSC accesses inside the IRQ handler when using MPAM-Fb
>>
>> Andre Przywara (11):
>>    arm_mpam: let low level MSC accessors return an error
>>    arm_mpam: propagate MSC access errors for hw_probe functions
>>    arm_mpam: propagate MSC access errors for MBWU counters
>>    arm_mpam: propagate MSC access errors for msmon helpers
>>    arm_mpam: propagate MSC access errors for __ris_msmon_read()
>>    arm_mpam: propagate MSC access errors for state saving function
>>    arm_mpam: propagate MSC access errors for mpam_reprogram_ris_partid()
>>    arm_mpam: prepare mon_sel locking for MPAM-Fb
>>    arm_mpam: add MPAM-Fb MSC firmware access support
>>    arm_mpam: change MPAM-Fb error IRQ to use a threaded IRQ handler
>>    arm_mpam: detect and enable MPAM-Fb PCC support
>>
>>   drivers/resctrl/Makefile        |   2 +-
>>   drivers/resctrl/mpam_devices.c  | 825 ++++++++++++++++++++++++--------
>>   drivers/resctrl/mpam_fb.c       | 252 ++++++++++
>>   drivers/resctrl/mpam_internal.h |  62 ++-
>>   include/linux/arm_mpam.h        |   2 +-
>>   5 files changed, 926 insertions(+), 217 deletions(-)
>>   create mode 100644 drivers/resctrl/mpam_fb.c
>>
>>
>> base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
> 

Thoroughly tested on a QEMU-based emulation setup with a fake PCC-backed 
MSC (MHU doorbell + SRAM shared memory + software-emulated MSC register
state). The setup exercises the full MPAM-Fb probe and runtime paths
including CPU hotplug save/restore of MBWU state, CSU monitoring via
SCMI, and kref lifecycle with multiple MSCs sharing a PCC channel.

Tested-by: Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>

Best Regards,
Srivathsa L Rao

