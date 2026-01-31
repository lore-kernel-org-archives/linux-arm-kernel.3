Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B58A2E6BF33
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Jan 2026 01:36:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nwKIHPfIqNrQskRu5VV0SgqK+bxynliXs5KVFHdnN9Y=; b=43Mc7qOzWoBps/LfWg3UiJrYSw
	ZZCdz8OhRW124avQHE8LPIjxPwicWR/QOfKffRME20jIpozXq0QVSJVuF7o9X8fhVEIoBmrDMFxEJ
	WiQo+JncOUoxYylCfD7Rkj1SQRIbZxoN3wSHryZ5lxq0PG7oFQnCN0KlxpUD+cX2sqJb2fwLHiL9V
	MTcQAq5vQAbsqtYgz+ZeQwvZ7Wcug1klbRbVXl3kUrhtO9IxiOtJgk4E4QdMJZsgkm2h0kvJwkbc1
	4zTJcVrkq07RCQ3aXsQ3uqmM+RsrBUzz4Fl0u+wBpEXx9saCaIKvQPO/K2Ww+PpmIAyKNUwg7L6lL
	EOxQLnJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlzu0-00000002C00-0GUm;
	Sat, 31 Jan 2026 01:35:56 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlztw-00000002BzU-49Xy
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 Jan 2026 01:35:54 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60UJjGhb2964998
	for <linux-arm-kernel@lists.infradead.org>; Sat, 31 Jan 2026 01:35:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nwKIHPfIqNrQskRu5VV0SgqK+bxynliXs5KVFHdnN9Y=; b=k2K2eiJ6ngAR8OVI
	iqC12vjdCw+SCciisdf1O9PB7J1bFivbr1BFQZqOvtxU1SiowRPWsi8iTQUEhY+x
	PGidqZT3WhoA6xj+jN8dGONU0ThPejazcw15rCkIvADEcyaQaehklZIR/dTPIW5B
	RKhK37kRqM9SLQdKBYHwVKHEmTbmp//23ZkSa2WVIpijfiY9RwmtyzzOsFZ0Xeyj
	dOfogsSV6C9SceiWSJ269Owil+MJlhMESctzkiH6cyzOlego+gKBpF+m7poo3spL
	23opbujIAJ8muit4/BEtXC96UDlnb6YB/opy+n+SLpYkmndLBKUm82srAkmEsrim
	3CqldA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c1332gt1g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 31 Jan 2026 01:35:51 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2b71bdcd037so1735595eec.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Jan 2026 17:35:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769823351; x=1770428151; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nwKIHPfIqNrQskRu5VV0SgqK+bxynliXs5KVFHdnN9Y=;
        b=KHBVl0EORuaSGHbh9GwD4u8nIzvKuq2J7vJCney9kqiYFppSY+DBb0AUrWtiHF/dIO
         UjNIlcujQEuF0ZFGsf3lTHXq6ATIPOexH8NdO1d0muVO9sNr897Yo7Y1keydRqJyC49D
         VXsVJFouRGgEkKQf16GoNaHpnMK6qPcvEiew8wqcpbJAR/gtQvHRLtrxofOYOuDEBKHK
         8BjxqR7zcfDZU1AKPRw6gw65HerS1vO+kZKAbABS5cIUXIeehmOgZ/q/mP1+DPVaHKJN
         yERQvGm23TOD1zU0Y+EE28hBfm7TjCQqSZIuODw9l6zGZ2IcLSZoGRJ6PJz+jDJ+8H2o
         pQiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769823351; x=1770428151;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nwKIHPfIqNrQskRu5VV0SgqK+bxynliXs5KVFHdnN9Y=;
        b=ci0aynKRmMMyM7oGlnxDrhzPqIu7GXKSQ+FhgsmSWFBO/U8xHjcVD0a7XOCPXo6i6S
         82Pf8U8DqUrTO+NNaKdtWxwdKW1I7j+4k4omSIJlRaHjUc1BtKgWny/Y+3fGguS/swI6
         nHEGlnIc5SZYPy+csYuFyBkETC4t6yFRxv4me/OtdUSz2MawWvatefCr0HCyvuuKnihG
         OSGPAIYU+IioGf3LrXwt57gYk53fii8jLZA31Jn52obXFdY/hJznqM+88T0HJTpwOW3i
         7zrO02WH+s9+0AGVCu+aFA+niM6qWqwu/VluciBicxhbWKEHPCT1ADDiubaWTuBB2luB
         V2Vw==
X-Forwarded-Encrypted: i=1; AJvYcCUTOB/3BiD9C8RN1a0mHn548jC0AEMNlsW9hEUkoUAa+DGy6TztAZ7/PwADGnltszsjEITjABOjL/ghwp/R5yVO@lists.infradead.org
X-Gm-Message-State: AOJu0Yxv3MEcYbZ24N7BiOqdCX0K+v72r9+JFAHEG0VRgEJrUiaHOFPz
	h6kiTlwdPgrhNbDpaY41V5AbX7UXQOaQDjWUFhK+3ZY6RA16+b0LoVogtFpRaihwnn0WcRvCx9f
	uT6kCkz7XPC1rqumOsuLq3B2Ag975UEZMyvotySRt8ofb/QF9X0kV+km8mOgA5qq3bUKKEXUIeF
	IOnw==
X-Gm-Gg: AZuq6aKP2EtTBiXpt/mNkYQxdEwVDfO4gJY1YUMWipcSTWqDupSAffH3uvGIJTi6ygF
	0cYr1VNzoOkK2OzJ1meTyrMlGmxaw3h1ZnNDzYxuqm4bs4ALvhtPQJEwOcn4bv6hefT1E4PA5zy
	V77BdhVGIwB1uIjcug11xzvWs1gwkAIavfAJvsS2THhR/jtaPqAj0HcZ2KIRkq4oWWb2A/m1izX
	Sul/xfqgGUubJpgyCFZ7nwapxvHrPRSgxR0O4xMLyVGMen4iHlqLtgkTRQdFxhabEBGXF4mZfbT
	e0x3pe6t0RfTfJDK4efvCnG3hN6VvJYtV5QdCTgPW8O731J5v+xXRZ7svhSCgb1JMcUvvFg15o9
	t65ZuBkez9nFEzneLvZAAxwmGrkllgF7kdU+U1jiVHeqD/p+IMPq6KDtOXPSQa8Et3FXZ
X-Received: by 2002:a05:7301:1288:b0:2a4:701a:b9ba with SMTP id 5a478bee46e88-2b7c941886dmr2146814eec.14.1769823350974;
        Fri, 30 Jan 2026 17:35:50 -0800 (PST)
X-Received: by 2002:a05:7301:1288:b0:2a4:701a:b9ba with SMTP id 5a478bee46e88-2b7c941886dmr2146803eec.14.1769823350411;
        Fri, 30 Jan 2026 17:35:50 -0800 (PST)
Received: from [10.134.65.116] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b7a16cf8f2sm14851809eec.7.2026.01.30.17.35.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Jan 2026 17:35:49 -0800 (PST)
Message-ID: <b5fd72fa-fcde-4f7a-bfad-17465d7e3841@oss.qualcomm.com>
Date: Fri, 30 Jan 2026 17:35:37 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] firmware: smccc: add support for Live Firmware
 Activation (LFA)
To: Salman Nabi <salman.nabi@arm.com>, vvidwans@nvidia.com,
        andre.przywara@arm.com, sudeep.holla@arm.com, mark.rutland@arm.com,
        lpieralisi@kernel.org
Cc: ardb@kernel.org, chao.gao@intel.com, linux-arm-kernel@lists.infradead.org,
        linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org,
        sdonthineni@nvidia.com, vsethi@nvidia.com, vwadekar@nvidia.com
References: <20260119122729.287522-1-salman.nabi@arm.com>
 <20260119122729.287522-2-salman.nabi@arm.com>
Content-Language: en-US
From: Trilok Soni <trilokkumar.soni@oss.qualcomm.com>
In-Reply-To: <20260119122729.287522-2-salman.nabi@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=V8dwEOni c=1 sm=1 tr=0 ts=697d5c77 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=yEY9MXV1_v7_bfR7OAYA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: eeeT9bp9IevEYL4azMLvHVB63Wxg5KW8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMxMDAxMSBTYWx0ZWRfXwBPhJcjICZaq
 i2iq9zANKUJvJfYctrB9Anikr8xTozcw44A6q1SMtH0glffsumpT6pDf/uKS7+OUnguUymlKG5L
 VvHZm+7yG9hyjvczuss76fDeKRzW64u3Qd5R9Az7xRKX2QUOh6wUsgK2sTM9BPQOP07OqFbdaTD
 lAKgrxhKXI1f7Vxx0/qBVZCVT3MagDI553joZA7DctDpwYLC4KejnCT3hauEZh5ptGqP55iNz9O
 0U9sz1Q/ICmXlIxebHKMbKhuDwDvAAPtIYSwiWaKjOPm/BPWDSKsR4+pToQRf7eIi1CG4NlGjXq
 vsPjmGHnxUIkWXDwlq/+8V/FlNx67tEJhHDiJrNkOh7fEVQZQan0mvBQyNCTr/XJF09j9AAR40x
 BMnTu+pLNDaHqPwbfZt388LLIgIczZx/07TNHG13j/hnBnyOMoDqpLRO/MBX6r/6aRtS91nu3Rk
 JY85Ald1QoKkApQRavQ==
X-Proofpoint-GUID: eeeT9bp9IevEYL4azMLvHVB63Wxg5KW8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-30_04,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601310011
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260130_173553_055956_F6EE14D0 
X-CRM114-Status: GOOD (  14.91  )
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

On 1/19/2026 4:27 AM, Salman Nabi wrote:
> The Arm Live Firmware Activation (LFA) is a specification [1] to describe
> activating firmware components without a reboot. Those components
> (like TF-A's BL31, EDK-II, TF-RMM, secure paylods) would be updated the
> usual way: via fwupd, FF-A or other secure storage methods, or via some
> IMPDEF Out-Of-Bound method. The user can then activate this new firmware,
> at system runtime, without requiring a reboot.
> The specification covers the SMCCC interface to list and query available
> components and eventually trigger the activation.
> 
> Add a new directory under /sys/firmware to present firmware components
> capable of live activation. Each of them is a directory under lfa/,
> and is identified via its GUID. The activation will be triggered by echoing
> "1" into the "activate" file:
> ==========================================
> /sys/firmware/lfa # ls -l . 6c*
> .:
> total 0
> drwxr-xr-x    2 0 0         0 Jan 19 11:33 47d4086d-4cfe-9846-9b95-2950cbbd5a00
> drwxr-xr-x    2 0 0         0 Jan 19 11:33 6c0762a6-12f2-4b56-92cb-ba8f633606d9
> drwxr-xr-x    2 0 0         0 Jan 19 11:33 d6d0eea7-fcea-d54b-9782-9934f234b6e4

Can you please explain or add a note on why we don't have name of the firmware
as the directory name and why you have selected GUID as top-level
directory name? 

---Trilok Soni

