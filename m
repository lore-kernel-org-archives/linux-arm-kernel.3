Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9A1BC982FE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 22:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LYxvfTdm3oz7TymPids4imwzrOSBJe+ux30GQWYD/WQ=; b=vJFMAr2KJNpopOyt48yfTcUPNQ
	U+ggEYR1QVR/lM0cE0V12RibNowfQnhYAlBsvjsmxNKIkvdSFZ7zQbnsPe8djN42g3uG7pC6B6F4d
	Roy41Agnt1eQMf0wuZLRf3ryHnCWnEsRL5BnQJGMRqzepQ0MnEuSJFgY6nUcpk49gm80yxlYxmW4u
	eTnkqQ+qdj7Wqf/afH4r41xs0fIreV2IyGYAv61etgKcChO3Di5EtajEx0R+q56Ehn7al812zhy02
	reKMzRxSytWGBgWq5bHrBnQ/pjMv9+vsEAwjZ37KpKTKZyqPD6IfoHXnGkF/wV9PvL1+2RC+G1V1K
	j7eGPLxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x99Nw-00000006i2A-1kWW;
	Tue, 22 Sep 2026 22:54:48 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x99Nt-00000006i1n-3ggo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 22:54:46 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MJD5jQ1166839
	for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 22:54:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LYxvfTdm3oz7TymPids4imwzrOSBJe+ux30GQWYD/WQ=; b=TgC+Jg227JT54tl4
	P5oAiVK2B3oGJAAJMrXG0Kz8oLZBB5wfKqJ/JTsnu6gDea3KvxyAXIqy06rrQHxJ
	BPTXp5Bw1Cy9Fx8d/V8xAxo+P/+OiHNzL9zUc6Wsok79fsbGQhIzId94CBYHb4bp
	skBUEfTUJYU+vlOqfF0o1arAozn4tgbQaZTjqQGXJKuL6nusRUJBJ3LRUKtFj13l
	aXK52LiNDgboYOpBgBX3YDbe7Ba/CY6ZfpjL8mVgbTDTaYgR0eW/eX3v1VCLU+/R
	aJ4fgVdyZjItZV3h+Jut4PysymBjF7GY/dpYwi6CNF1CHWgEUmcVoZBrwjvk4SCb
	hqqqFA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guymw0yga-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 22:54:44 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30f1b904861so385242eec.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 15:54:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790117684; x=1790722484; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=LYxvfTdm3oz7TymPids4imwzrOSBJe+ux30GQWYD/WQ=;
        b=I4iNNPVP4vua+sLx+sttmynWQiKUlFdxDtafL8085SU4yL33d/dHAZ1OnefIqa7miI
         Ejm6S2ICT7vVllkIi8Q9vjoF+8ejTsyeBrvjITmWuHP4F44XxRwL7mbNWgHNKBIjfP/9
         8YHgYQ+NmyLm2/TPsMqoN5uzgcOSZzQ4aduJLvJ98jT28umVCgdrCVEPfsXcNM4buW7O
         NY3pWKJJw4KmiYTJSDa0qRTnzioj22qSxtMBFrlTcMrMUc+cdnEW/AUxYKtKBn12blAw
         onjXVRgHvTxbSwM3Zfy1mQ7DejPSQZU15FtzKR+/n2gUv3FO2WN1BfImKcYMP/DKiWBK
         lM2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790117684; x=1790722484;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LYxvfTdm3oz7TymPids4imwzrOSBJe+ux30GQWYD/WQ=;
        b=bc9uwA/9+73iSnAaTf20QFbehTLUijnBHXG4nZkNGUkhiA5e6QS5b6LV6w7HMjz4kI
         UooU8bM0hF8NG27+0TQoZW6MMlzOjwyxLyeFHWGcKuMiCEX+zYLUaGcWKTGN8H3CpZkX
         W9KYRKrQSghudMXbIu7VReUZPso/5bcVmDgcrFaMFusZR+l/a/vr8gpyiKsRLwsmjbFz
         WR9LZgLpAVL0BLy+bz4baKiJcPLMSPJlthlxs+BCi4tSmt+vD3QBqm5hw2GU4pYPy4AM
         gWnyP4K5NVvT4sRGRgBTxObN8chjYA3pDB9meDTXcjpuKBndGrrsaQPPwYJcaebI1IHR
         /GMw==
X-Forwarded-Encrypted: i=1; AKwUvBzoLFGPuNplBwjiTNInzylo+fogyNesKWWo9zK6NJIak4BluFssMldUBxGUE0/NO0TxZ0zBaDRU2YwXgaDAwQuS@lists.infradead.org
X-Gm-Message-State: AFuF++mUIcYNUiyDXZEJRnrr1TcigTttFsnefcW+73vkClIO/wfhPkYR
	dwqPtcb5uvk40EUCgofv4ocqLujMmndQnv4PSv/YW3rKP8+6CAwqBC/Ogo4ALSFih70HPyLqJwa
	Btj2igjL0ZM9JxuQ+s1VyZKKlUk/5jjx0FmTBb9tg45ECEDVz6NOV3nxR/JJoYYnQiGthqQd0eO
	6cXA==
X-Gm-Gg: AYBFou3qf9Md2yRa4xs4WD6SeOO2HOFD7oNZ6K9ZcHq01MUNpyxvhukOH0IpQaRbmCQ
	cW/SEagMiBOEtL54dGKZcxvcuiKZlmw+PuDOdJmxmDDU05Z4QbdVTH8fDmYx5VYVt8ERAtHM1CV
	+JJN4qYyi5YgBajYOWPRrzBrvHwm/fYXV/tSYjVZiWRyqf3UUGFycuKHpvhtepcoNO5el3x7roy
	Lvc8i4X5Ti1C2AkRFo8rXTqej172fZP9E2oVDZYbm3KDPigYd5mv77ZzeHilyPpyL1P4csPbciH
	t+exmUn1/VFfA+4QJsTUKunyLJG169p1hzVj77H5dF5ik//J8AYpg7ggUBvU7SDaFKpEJ27+pXQ
	/Ejm/1odAjux9NNRMxUJTT/SIDJ2HZ8rE04/nCRRjBH/bh7GaCCDW6g==
X-Received: by 2002:a05:693c:638c:10b0:33e:6a54:b3ef with SMTP id 5a478bee46e88-33e8c05f69amr760384eec.18.1790117684086;
        Tue, 22 Sep 2026 15:54:44 -0700 (PDT)
X-Received: by 2002:a05:693c:638c:10b0:33e:6a54:b3ef with SMTP id 5a478bee46e88-33e8c05f69amr760352eec.18.1790117683534;
        Tue, 22 Sep 2026 15:54:43 -0700 (PDT)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e96e48e3esm1320134eec.26.2026.09.22.15.54.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 15:54:43 -0700 (PDT)
Date: Tue, 22 Sep 2026 15:54:38 -0700
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, maz@kernel.org,
        will@kernel.org, catalin.marinas@arm.com, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, steven.price@arm.com,
        aneesh.kumar@kernel.org, oupton@kernel.org, gshan@redhat.com,
        joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
        linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
        sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
        WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com
Subject: Re: [PATCH v19 17/20] KVM: arm64: CCA: WARN on injected undef
 exceptions
Message-ID: <20260922155438.00000f3d@oss.qualcomm.com>
In-Reply-To: <20260920212845.707-18-suzuki.poulose@arm.com>
References: <20260920212845.707-1-suzuki.poulose@arm.com>
	<20260920212845.707-18-suzuki.poulose@arm.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDMwNCBTYWx0ZWRfX1v3FWCPtK9t5
 VEAO79bxUx3FLlTxLDEzyeJ3mJ0HQoNzpcSAmIF2jvSV1c7OvjhKrJs/REL/8d8b9HOgoeLtMDh
 xuWY9LIt2UJ0+UWjwUVjKTgBG/AcvduuZAyiGFH4kblIlqGXwt2DrCNxQEDoR9o6pHPrBkCqoYb
 94bWBT1/o49kJFdqsuLmE9olh15noPjOOpL4PwfmbC8X6DtDYd0RWnM/CrxSfOz3nDsQ0V+5/Dw
 zeIAuaNHpq57++x1RsGF3bEJLatSrg4YCf76yPW+ZoH1Ctp8/pi+Pk0u5h+2DAH3W9z8tAxzvDV
 kasQdKgrjXIFM97QtgmBnoBcBspmL2dBFUOn4QcnZYK13ivO5a4q+Ib61JtA8GDkWKwZFNGH3Tg
 VYgj40KVMxLPSD3r3t1IjwOVsuEXphRsd6D7RnJHgl1Wq7BlSM+0JM8tMtzoEbSOJv6NoUVl/aa
 +kLUhrL0T1EYNFYmsNQ==
X-Authority-Analysis: v=2.4 cv=feI4WEQF c=1 sm=1 tr=0 ts=6ab30734 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=DI-nzRUvp28q1R9r8mgA:9 a=CjuIK1q_8ugA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: lTCtXGdqC1XceO00qoVzxgmGYpC8_rRn
X-Proofpoint-ORIG-GUID: lTCtXGdqC1XceO00qoVzxgmGYpC8_rRn
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDMwNCBTYWx0ZWRfXxuXhwhG6zfje
 wmRu91r46m1RHa75rBGNSl/sEebn0iofZrpuSoJrbvp2Zra7HVVHpPdzqE384YDUNGn+1n4DNSi
 koPjnznzx3HTduU3V8wK2Or3nVUO15A=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220304
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_155445_924894_A72541C1 
X-CRM114-Status: GOOD (  12.04  )
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

On Sun, 20 Sep 2026 22:28:42 +0100
Suzuki K Poulose <suzuki.poulose@arm.com> wrote:

> From: Steven Price <steven.price@arm.com>
> 
> The RMM doesn't allow injection of a undefined exception into a realm
> guest. Add a WARN to catch if this ever happens.
> 
> Signed-off-by: Steven Price <steven.price@arm.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>

