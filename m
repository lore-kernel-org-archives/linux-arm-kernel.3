Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F7E5EC01B6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 09:50:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7P07Ahcdh4DPBeNK1tqYTnpufwuJ3YzytC0z563zCsA=; b=P/g5I6pg8eId8Q
	3sqdbRQu3+8dMBGzMSH6H19X4rqYNhfqZ/K9Bf6G2v3f+VlFv89hcZReckw/HkR50ReZyDtQwTAHT
	Rwn0nloRxxQDVrn35iPEqz3RPflh7SqKyLtnvejiLFfC/Hbk7OSlfTDaqSN0riqnOrGV1UX+0WWTs
	fR4jWXH4t6AGSx4wh5rFW0EvfkD0+LNBD4KwHWEJ9cYy2AY0RiTvZcOzenMqvzw/yr3a+qCVpu69T
	DTtFtHpirOhFJxB52OF7FMEzgvL3O/YCJjfFlxRuizbetbrZFECnswKrZWovE/hoQidnLQBoBblNm
	3205vM9fKxUr+vVKFuJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4bv1-0000000GPAO-2yAt;
	Mon, 23 Mar 2026 09:49:55 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4buy-0000000GP9q-0qC7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 09:49:53 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N7tWWm1627093
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 09:49:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=7P07Ahcdh4DPBeNK1tqYTn
	pufwuJ3YzytC0z563zCsA=; b=loyG8+435M3gkv906ABl/fVRnSqgu/tbyje6tl
	Q8Owb7zEUEp05I6DeL8eufU++qlw0YMQPhJbVSvOxwFNUhK6kwdmH6b4cegZpviT
	AxITZKGjcYe0aVE4g4Lv+6u9sQtT+J63WrWJPk9XLpuK6j7j5zL4fZB4/NBlAyqe
	a3m+sBFkLy0OKq3c8mZ7LAeKR9y0G5KAfQ8eoa9KYEXg0lIiq4QORQaMgvWJVTA5
	9oDhnUMAyEBwlBZZJ96Zryuk6kkNjafo2g9Zs7jhqYb6jqDY9ZLRW971Ummxz/LY
	xM8RxV/pD3ALxYFnEuUL850c+jv9Ejhog5pOWVQQSHq2HUng==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d31jc0dft-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 09:49:51 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c7381a9a932so1593252a12.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 02:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774259390; x=1774864190; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7P07Ahcdh4DPBeNK1tqYTnpufwuJ3YzytC0z563zCsA=;
        b=jwAbGsy/SeAX7EKKtxgGHO4ylP5NxwV4RWi+yjkoB2Xrjbu5sLMTT08iCTDkxXkgiZ
         lfzqDIJNxYaEJciPUIFoZbzBwzPJIfAv0f4iQaH47P7hQ4M9RIoMHX9t9gjQyrstR2pk
         7k4XMOIc8TNIDLQ8BDImc01/rulzGgwBx84pgw/6wu/hr5qV+mIWMssPolsI/7fSCQXf
         3Zg7MahJce/ls7mai6MOSeDMm1j03lSpsGPOS//qtcT1NPKSngj6JAyg8ays3Qg8PDIf
         3pV4RkIoPha1iqQDzMlVGH8YXJF4UxhvMFCSf2x2F97O41PpR8UMfO5z4+/Kd9iglWr4
         L/4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774259390; x=1774864190;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7P07Ahcdh4DPBeNK1tqYTnpufwuJ3YzytC0z563zCsA=;
        b=fIvJlMhY4iOIJLHUgTU9OiJHWSP+x9RT33LcZO/pP5wKBjjT8iY6ElPzypBRpN2NqU
         qHogsp+3Usfn77uvGecgzBuYpsgeHOBmBHq9sZPkUOD++92iut5JV+Mwz1v+REmOwR2S
         iGusT/Qtg/rZjtEQqfae9d4iskXsP0bIaJCH9Vn0RlsAn8wr3S1gcz8EHOjTcncT9YLB
         +xLAmgyp2L7GdimGiNYtVJMTMRLFkjPrhapNVq6y+s202cC/Vsm5qJK7PCnf5Uu7KQRd
         V3EjY46wdpII4Yyxgrht7IVZsG/1wpaBLXYmzK4kFz9k9k4ikGsNEzXzmO25GDhA9BID
         ARqg==
X-Forwarded-Encrypted: i=1; AJvYcCUFPGhpZgPOGi9B0eMgu01QwZ5T4h4CuSGN3tAlUyK1GXdY4AubXd8b5fbobfCMUzszVrhiIqSPzKNRRKfVVniU@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7AiYUJplk5wLucQ6sakZbCwq4ZFLNSHVh7gjc68rGCfvq1hjH
	iOlPebRRBABniqzkinmUk2TVgismeRMBvnGGyktTfnuym9De8fYPJrDW2YpBbW3pOP+sT8e2UtQ
	npsOoQ1tNoacEBMyQNf1KmmWqRwwaEsLxW1VgCBf2Fi+DW+Sx/D2jLdve65mYKoYsK64RRn29PJ
	oI+w==
X-Gm-Gg: ATEYQzyK/l7HYDRi43rKtNjlAFtkSm2SP10jtyGzKf2hz2GNrCzylvP89NdxutECrJS
	0N9IboN+qcDVEuuBaj89zVM++JCZNclwcrlqF18G0wGWZYu3nG22bjQzUma3tAmi3fqyD2WPisA
	T8jR3Qn4mEdOdfysR6gPFkJnkLoJvPOQw7yOl90Q77LX/jXoBMEt8E5jYmf8AMexu6MvngtKVBr
	Y8YU4JYFmHFou9IZ5QoLobDjiCYLAuiuovInsnJPczZ3osnWJVaRK/JLCDukr5HJhavr6BK96TO
	vfARYTokr4mby/NtHJLzEYscut1PZnoWk50b0waYTcR9XpOJC1t2lJg6kq3TVDLHQ3UdPkD9xR+
	pZeq64/UYPFWxWKhFaK7xfjG+k+UbnfKLmo91UptmRzlCAO3nMnnzkZMWX1FAM00V0jlMB/0JR3
	Tso+f+2Icd
X-Received: by 2002:a05:6a20:9189:b0:398:a76e:4ad4 with SMTP id adf61e73a8af0-39bcea1df3emr10686659637.21.1774259390181;
        Mon, 23 Mar 2026 02:49:50 -0700 (PDT)
X-Received: by 2002:a05:6a20:9189:b0:398:a76e:4ad4 with SMTP id adf61e73a8af0-39bcea1df3emr10686627637.21.1774259389637;
        Mon, 23 Mar 2026 02:49:49 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c743a939af0sm6591935a12.16.2026.03.23.02.49.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 02:49:49 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Subject: [PATCH v16 0/7] coresight: ctcu: Enable byte-cntr function for TMC
 ETR
Date: Mon, 23 Mar 2026 17:49:25 +0800
Message-Id: <20260323-enable-byte-cntr-for-ctcu-v16-0-7a413d211b8d@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAKYMwWkC/43NQQ6CMBAF0KuQrh3SUmiLK+9hXECZShOg2gKRE
 O5uYeXCGDeT/J+ZNysJ6C0Gck5W4nG2wbohBiZOCdFtNdwRbBMLktFMUE5LwKGqO4R6GRH0MHo
 wzoMe9QTGKIGClaqWhsT7h0djXwd+vcXc2jA6vxy/Zpbv9T9sXAUKmiqVcSwqheLiQkifU9Vp1
 /dpHGTnZ1Z8kIz/JItIMimlYTk2nJVfyG3b3r/xSf8fAQAA
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Mike Leach <mike.leach@arm.com>, Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774259383; l=9355;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=4qZFcvPq4IDipSZwkZ9LtIXn1RxWXKNMQrdLyvEdl0I=;
 b=cO4RG/kpQ3rfVdDUivQuwmy9H0OCEejRCIlhPC8W6yOBDlwCVya4LgyCnV5xebPG1+zWfOgfB
 YIDOgGF1GFGCWjgAS43gjdwkVTlclL56PPY9OX2YTUzWjT9kY0hNzjl
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Authority-Analysis: v=2.4 cv=fKc0HJae c=1 sm=1 tr=0 ts=69c10cbf cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=7CQSdrXTAAAA:8
 a=KKAkSRfTAAAA:8 a=QyXUC8HyAAAA:8 a=JfrnYn6hAAAA:8 a=KXRl9pNFgIUfUIjHtNEA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
 a=TjNXssC_j7lpFel5tvFf:22 a=a-qgeE7W1pNrGK8U0ZQC:22 a=cvBusfyB2V15izCimMoJ:22
 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-GUID: -lkFvl2BnbZcDEVbVjAP8qhNfJxwYOTe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA3NSBTYWx0ZWRfX0OMU38XzhhXU
 H6oni6ufd9ksY2L0WcnilWuPLhfDcP1mnUqIWLN7XbvuQ+6liyQ62e+LMGdREKQRVh8LuP/uVUi
 ylCo9llnr82xTQ/j3l+rKcavqqcdHRlgAmpQjgbgWsdUtExc75yVpwVSuEg6FxSbqMKidWJxieN
 YEM2kbQzhlP7V+0IXDYtuRG2cXiBvx8Ejqt/QFnA6Ux784gxulE8WFXAv/eUBLzCT5ucH7r1TO1
 ItWU5fleVlV6pqXDO+0QCTEmYMT8En2cpJgzzMD2haZdCf+Wt3Uo/2kjdFsz6sO+4ZeNhx/v1El
 q8YPmQ0yGWm61YAkK78Q1lgR5XchK3p6lk5fuiBR3n0GZ5zskWJ1976HVXA38jbrMPk45KprMt7
 8nYksxMOvh4fe2kNZWrBjKWJiMHALKL5ki0hFgAFyT3OxQlaCxbwUw0x++Uz7AiDRgV94qkZj8M
 GetUjemf128U5MxR68Q==
X-Proofpoint-ORIG-GUID: -lkFvl2BnbZcDEVbVjAP8qhNfJxwYOTe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_03,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 adultscore=0 bulkscore=0 spamscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603230075
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_024952_251657_6D0EA4C3 
X-CRM114-Status: GOOD (  27.27  )
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

The byte-cntr function provided by the CTCU device is used to count the
trace data entering the ETR. An interrupt is triggered if the data size
exceeds the threshold set in the BYTECNTRVAL register. The interrupt
handler counts the number of triggered interruptions.

Based on this concept, the irq_cnt can be used to determine whether
the etr_buf is full. The ETR device will be disabled when the active
etr_buf is nearly full or a timeout occurs. The nearly full buffer will
be switched to background after synced. A new buffer will be picked from
the etr_buf_list, then restart the ETR device.

The byte-cntr reading functions can access data from the synced and
deactivated buffer, transferring trace data from the etr_buf to userspace
without stopping the ETR device.

The byte-cntr read operation has integrated with the file node tmc_etr,
for example:
/dev/tmc_etr0
/dev/tmc_etr1

There are two scenarios for the tmc_etr file node with byte-cntr function:
1. BYTECNTRVAL register is configured and byte-cntr is enabled -> byte-cntr read
2. BYTECNTRVAL register is reset or byte-cntr is disabled -> original behavior

Shell commands to enable byte-cntr reading for etr0:
echo 1 > /sys/bus/coresight/devices/ctcu0/irq_enabled0
echo 1 > /sys/bus/coresight/devices/tmc_etr0/enable_sink
echo 1 > /sys/bus/coresight/devices/etm0/enable_source
cat /dev/tmc_etr0

Reset the BYTECNTR register for etr0:
echo 0 > /sys/bus/coresight/devices/ctcu0/irq_enabled0

---
Changes in v16:
1. Remove lock/unlock processes in patch "coresight: tmc: add create/clean
   functions for etr_buf_list" because we are allocating/freeing memory.
- Link to v15: https://lore.kernel.org/r/20260313-enable-byte-cntr-for-ctcu-v15-0-1777f14ed319@oss.qualcomm.com

Changes in v15:
1. add lockdep_assert_held in patch "coresight: tmc: add create/clean
   functions for etr_buf_list"
2. optimize tmc_clean_etr_buf_list function
3. optimize the patch "enable byte-cntr for TMC ETR devices" according
   to Suzuki's comments
   - call byte_cntr_sysfs_ops from etr_sysfs_ops
   - optimize the lock usage in all functions
   - remove the buf_node parameter in etr_drvdata, move it to
     byte_cntr_data
   - move the tmc_reset_sysfs_buf function to tmc-etr.c
   - add a read flag to struct etr_buf_node to allow updating pos while
     traversing etr_buf_list during data reads.
Link to v14: https://lore.kernel.org/r/20260309-enable-byte-cntr-for-ctcu-v14-0-c08823e5a8e6@oss.qualcomm.com

Changes in V14:
1. Drop the patch: integrate byte-cntr's sysfs_ops with tmc sysfs file_ops
2. Replace tmc_sysfs_ops with byte_cntr_sysfs_ops in byte_cntr_start
   function and restore etr_sysfs_ops in byte_cntr_unprepare function.
3. Remove redundant checks in byte‑cntr functions.
Link to V13: https://lore.kernel.org/all/20260223-enable-byte-cntr-for-ctcu-v13-0-9cb44178b250@oss.qualcomm.com/

Changes in v13:
1. initilize the byte_cntr_data->raw_spin_lock before using.
2. replace kzalloc with kzalloc_obj.
Link to V12: https://lore.kernel.org/all/20260203-enable-byte-cntr-for-ctcu-v12-0-7bf81b86b70e@oss.qualcomm.com/

Changes in v12:
1. Add a new function for retrieving the CTCU's coresight_dev instead of
   refactor the existing function.
Link to v11: https://lore.kernel.org/r/20260126-enable-byte-cntr-for-ctcu-v11-0-c0af66ba15cf@oss.qualcomm.com

Changes in v11:
1. Correct the description in patch1 for the function coresight_get_in_port.
2. Renaming the sysfs_ops to tmc_sysfs_ops per Suzuki's suggestion.
Link to v10: https://lore.kernel.org/r/20260122-enable-byte-cntr-for-ctcu-v10-0-22978e3c169f@oss.qualcomm.com

Changes in v10:
1. fix a free memory issue that is reported by robot for patch 2.
Link to v9: https://lore.kernel.org/r/20251224-enable-byte-cntr-for-ctcu-v9-0-886c4496fed4@oss.qualcomm.com

Changes in v9:
1. Drop the patch: add a new API to retrieve the helper device
2. Add a new patch to refactor the tmc_etr_get_catu_device function,
   making it generic to support all types of helper devices associated with ETR.
3. Optimizing the code for creating irq_threshold sysfs node.
4. Remove interrupt-name property and obtain the IRQ based on the
   in-port number.
Link to v8: https://lore.kernel.org/r/20251211-enable-byte-cntr-for-ctcu-v8-0-3e12ff313191@oss.qualcomm.com

Changes in V8:
1. Optimizing the patch 1 and patch 2 according to Suzuki's comments.
2. Combine the patch 3 and patch 4 together.
3. Rename the interrupt-name to prevent confusion, for example:etr0->etrirq0.
Link to V7 - https://lore.kernel.org/all/20251013-enable-byte-cntr-for-ctcu-v7-0-e1e8f41e15dd@oss.qualcomm.com/

Changes in V7:
1. rebased on tag next-20251010
2. updated info for sysfs node document
Link to V6 - https://lore.kernel.org/all/20250908-enable-byte-cntr-for-tmc-v6-0-1db9e621441a@oss.qualcomm.com/

Changes in V6:
1. rebased on next-20250905.
2. fixed the issue that the dtsi file has re-named from sa8775p.dtsi to
   lemans.dtsi.
3. fixed some minor issues about comments.
Link to V5 - https://lore.kernel.org/all/20250812083731.549-1-jie.gan@oss.qualcomm.com/

Changes in V5:
1. Add Mike's reviewed-by tag for patchset 1,2,5.
2. Remove the function pointer added to helper_ops according to Mike's
   comment, it also results the patchset has been removed.
3. Optimizing the paired create/clean functions for etr_buf_list.
4. Remove the unneeded parameter "reading" from the etr_buf_node.
Link to V4 - https://lore.kernel.org/all/20250725100806.1157-1-jie.gan@oss.qualcomm.com/

Changes in V4:
1. Rename the function to coresight_get_in_port_dest regarding to Mike's
comment (patch 1/10).
2. Add lock to protect the connections regarding to Mike's comment
(patch 2/10).
3. Move all byte-cntr functions to coresight-ctcu-byte-cntr file.
4. Add tmc_read_ops to wrap all read operations for TMC device.
5. Add a function in helper_ops to check whether the byte-cntr is
enabkled.
6. Call byte-cntr's read_ops if byte-cntr is enabled when reading data
from the sysfs node.
Link to V3 resend - https://lore.kernel.org/all/20250714063109.591-1-jie.gan@oss.qualcomm.com/

Changes in V3 resend:
1. rebased on next-20250711.
Link to V3 - https://lore.kernel.org/all/20250624060438.7469-1-jie.gan@oss.qualcomm.com/

Changes in V3:
1. The previous solution has been deprecated.
2. Add a etr_buf_list to manage allcated etr buffers.
3. Add a logic to switch buffer for ETR.
4. Add read functions to read trace data from synced etr buffer.
Link to V2 - https://lore.kernel.org/all/20250410013330.3609482-1-jie.gan@oss.qualcomm.com/

Changes in V2:
1. Removed the independent file node /dev/byte_cntr.
2. Integrated the byte-cntr's file operations with current ETR file
   node.
3. Optimized the driver code of the CTCU that associated with byte-cntr.
4. Add kernel document for the export API tmc_etr_get_rwp_offset.
5. Optimized the way to read the rwp_offset according to Mike's
   suggestion.
6. Removed the dependency of the dts patch.
Link to V1 - https://lore.kernel.org/all/20250310090407.2069489-1-quic_jiegan@quicinc.com/

To: Suzuki K Poulose <suzuki.poulose@arm.com>
To: Mike Leach <mike.leach@arm.com>
To: James Clark <james.clark@linaro.org>
To: Alexander Shishkin <alexander.shishkin@linux.intel.com>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>

---
Jie Gan (7):
      coresight: core: refactor ctcu_get_active_port and make it generic
      coresight: tmc: add create/clean functions for etr_buf_list
      coresight: tmc: introduce tmc_sysfs_ops to wrap sysfs read operations
      coresight: etr: add a new function to retrieve the CTCU device
      dt-bindings: arm: add an interrupt property for Coresight CTCU
      coresight: ctcu: enable byte-cntr for TMC ETR devices
      arm64: dts: qcom: lemans: add interrupts to CTCU device

 .../ABI/testing/sysfs-bus-coresight-devices-ctcu   |   9 +
 .../bindings/arm/qcom,coresight-ctcu.yaml          |  10 +
 arch/arm64/boot/dts/qcom/lemans.dtsi               |   3 +
 drivers/hwtracing/coresight/Makefile               |   2 +-
 drivers/hwtracing/coresight/coresight-core.c       |  24 ++
 .../hwtracing/coresight/coresight-ctcu-byte-cntr.c | 286 +++++++++++++++++++++
 drivers/hwtracing/coresight/coresight-ctcu-core.c  | 123 +++++++--
 drivers/hwtracing/coresight/coresight-ctcu.h       |  79 +++++-
 drivers/hwtracing/coresight/coresight-priv.h       |   2 +
 drivers/hwtracing/coresight/coresight-tmc-core.c   |  55 ++--
 drivers/hwtracing/coresight/coresight-tmc-etr.c    | 226 +++++++++++++++-
 drivers/hwtracing/coresight/coresight-tmc.h        |  42 +++
 12 files changed, 789 insertions(+), 72 deletions(-)
---
base-commit: a0ae2a256046c0c5d3778d1a194ff2e171f16e5f
change-id: 20260309-enable-byte-cntr-for-ctcu-ff86e6198b7f

Best regards,
-- 
Jie Gan <jie.gan@oss.qualcomm.com>


