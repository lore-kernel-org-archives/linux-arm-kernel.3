Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBD3FCD98DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 12:33:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=RTgeCyE7ZzjwZw/j8uVLqfETe5WOLfX91wRWOaFoB0c=; b=HsgxRKQC1nICJL
	VQ861APIuoBkklf+YUZHyMZyVzQ528bzXNHFIO9ESj6iVUXtK6ENpg6KDmNlJvNIWu/q9k8SD07EK
	60avOwWUddWk8ufZOX69kjtkLq+gKyiUX8oCKihOdWnTBosPsE3TFN+zf07NI+RddMndXde/KgOOH
	sfkthqWJgSn9aUrK3trkYbIUCV2Y3za4GYhDmCgpgNxd92F+78bVO2koV4RagxLTvpHHlYCzpg9GB
	BFl5HiycRjQgYKvji9D7OEZy03fMvcd99MYJ5FUEENWtfv1WIL+lPifQtwUB85A9CHiIE7jr4qw7u
	Vk68880kVRSSV2i/wlJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ6V5-0000000ECd0-20IK;
	Mon, 15 Jun 2026 12:33:11 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ6V2-0000000ECcQ-3ZCu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Jun 2026 12:33:10 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65FAoN4w2481235
	for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Jun 2026 12:33:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=RTgeCyE7ZzjwZw/j8uVLqf
	ETe5WOLfX91wRWOaFoB0c=; b=m0t0gN/wBAv+Ng8m+f94CXPp7NmPtB/hscC2of
	/87nwRzIx4g8uUG75jPjRu9HWMdkVaOH3KTft8Nx8OeBczscSkeTSGFlSUX88AaM
	0OF36uxsYH7eVYN+8ZbO3lulELGe47UO+uM0/mhBAmZszS+IoIyWJRMX78UNVY9Q
	2mwAOqFSi8vhdhNUPvaKjAHRX8of9pqJ7x7i4iyK7QE8ivwTACMUCRi5+pushI+Y
	ubkpfYGU0WntI+d+TfXXjMSdUlgrlDqGrmV2vaqRqqtm/LOIpUDGtbL3IJ7ME2QC
	Q14ssbV5b3uR3y+CQ8CBAvTh1roH0us0G3qAvr3AxJvYevWw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ete980u1b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Jun 2026 12:33:07 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-84256bee9a9so2265387b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Jun 2026 05:33:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781526787; x=1782131587; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RTgeCyE7ZzjwZw/j8uVLqfETe5WOLfX91wRWOaFoB0c=;
        b=WdvMUajzFut9mGXmsOq6ljLt4pANyyPw1gOSDyyJaalygMAZ9hQFjsK8XMGeEVK3nT
         6hzKUabinzx1Bggu61lN3ecUMKR6AMttotl1UZScWLGj+wupS+ocvEkW+H6LrpWcx2Br
         CltILibMc0ondIQm1hnIY8MIXdm+JzTUxvBgZylSvXuvOu1yIULb3BGrHuyme6951urz
         GlFxHw+kRcNZ1+QOTsItMpFNbj3QP7n/TWQ/qDQoa5dlxlVYBBI6SsvEwCdCKc6ArTUM
         mEfrCWBXWwq/7QIOKKr4jmIQPTbgc8vjw+MHj2WqPsBvACNPhhSzxRz4GaVG5azIAMVt
         marQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781526787; x=1782131587;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RTgeCyE7ZzjwZw/j8uVLqfETe5WOLfX91wRWOaFoB0c=;
        b=ZKJQmIcMgdd3N7qEdMMyXh/WLFXgAouWyqXzFhpvnJiftqMj/MM9NTTjoIMJHSJFlN
         DmwHdXuDxIA65Ccs0YhucO/cZGZhmLwsn9UQ7k847wAF9BOf2vuwIFuXMX7fSytEcmpc
         CGvb3L/mQzW1WkkLzLBVec99sEQBMCg92ejwI2nTs3nsACMYqVWgYmNLBb8vE1C5R7hf
         pr83hu+x+DVKDAgftqytF9JudVWdfT7NgEJCgs6QLbbDp6s0shLQvjhFH5gIko6yn9DF
         myFI9qQF3o3NOhL30FpLhcaxE13mFDs45cvanCStyzlgIx8zOdQCPK+6PG6iqOhD1o/u
         DnMg==
X-Forwarded-Encrypted: i=1; AFNElJ/HKAQ6JSIISDcX44yRqupUsMBdBqDgzk0Mp2IKt395nDouABZLyQeMZNdfzfaABnnLRTtyJnhHUUnYkhZ7GhfC@lists.infradead.org
X-Gm-Message-State: AOJu0YxBzeQ25NIWT/ecW3MMrJDxZHoiDqUWNW0B3eo+75xUpmbkr/Bg
	KcSul28i5SW+wUNRxQtEk9grpZ4B9Fs3U05bC98Z56gXgncwS1HtJ7nJrDA//72rOZ3jRk5leYr
	YBrsB7DZnUuUqZcUuh52MG77yZKH1bW5gpJ7ZiJ2onwZiRha15CDTXTCckckAynpKJQKpS6IbYg
	gkGy4KuNAqaw==
X-Gm-Gg: Acq92OHDzewjoq/Soj97o7npIv+70sJIVcwBH6VRT2rqZ1KdkQRnDDcO9GwDRF6nCAA
	emIivjWZuqR1mMJXbV0X4NOSZ7ZWe7Kbjj33JujWf/I47MyqIZhhKLckTbEDPsbxGc8ocA4cCyI
	3wiH8+JLy6o8ClVUdelEhjsMq1UUdvH5hmkfHVdGOYG84PAYJCneUsEvuck4XGv0/pKaXEnRhwx
	fLHkuAodu8dwWQcL7ZXEa4Tb1vEI01RJDnycrR51sA6FCmhNTMDgUIWII/IFFku0g2i45X0e7iX
	CvSDKbI3jdBKeG3AD7CNs0zAvFGy3vfzS9/02l52Qipv/81zKP7OyFEC23VidmeoB0NPLbtvlaZ
	fYQqZsIubkXGZIDBW2M0YLIgtIKGHtS1bU5doCQundrSJ+dxvWXs4ZpwOYTEV6E0YgTnb6CtvDE
	aiFNk1Wuk35IYZFA==
X-Received: by 2002:a05:6a00:1ac9:b0:835:405a:7e6d with SMTP id d2e1a72fcca58-844e1a3dda0mr11453424b3a.21.1781526786513;
        Mon, 15 Jun 2026 05:33:06 -0700 (PDT)
X-Received: by 2002:a05:6a00:1ac9:b0:835:405a:7e6d with SMTP id d2e1a72fcca58-844e1a3dda0mr11453371b3a.21.1781526785902;
        Mon, 15 Jun 2026 05:33:05 -0700 (PDT)
Received: from jinlmao-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434b03fd0bsm9968393b3a.50.2026.06.15.05.33.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 05:33:05 -0700 (PDT)
From: Yingchao Deng <yingchao.deng@oss.qualcomm.com>
Subject: [PATCH v10 0/5] Add Qualcomm extended CTI support
Date: Mon, 15 Jun 2026 20:32:28 +0800
Message-Id: <20260615-extended_cti-v10-0-1c1694b6d8ed@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIANzwL2oC/x2MXQqAIBAGrxL7nKAR/V0lIqL9rH2x0AhBvHvS4
 wzMJArwgkBTlcjjlSCXK2B0XdF+bu6AEi6CGt10ujNGIT5wDF73RxRzO/YGdhzsRiW5PazE/zc
 vOX+t9x2WXwAAAA==
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, quic_yingdeng@quicinc.com,
        tingwei.zhang@oss.qualcomm.com,
        Jinlong Mao <jinlong.mao@oss.qualcomm.com>, jie.gan@oss.qualcomm.com,
        Yingchao Deng <yingchao.deng@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781526781; l=6468;
 i=yingchao.deng@oss.qualcomm.com; s=20260611; h=from:subject:message-id;
 bh=iXQ4jRd7ZWhZy6UdVz/NuIRaIQz2T5K6T2yqI6GZwOU=;
 b=uPmEudap3yOFU9fJfvOXURiLtSN1ODahVEhiGAZIrTbWot3FPwqjCTqV0PBLJbLGD73wJnmAX
 w+ZrN+AVXNXDhKM58Pp/gQe6Ur5ZtV+Fgot8J86anJTPyrJeSHhWRwh
X-Developer-Key: i=yingchao.deng@oss.qualcomm.com; a=ed25519;
 pk=+y3U2mIt7mf0C+x6qBUD670cd9S2QV+yl5015bUYMgs=
X-Authority-Analysis: v=2.4 cv=V5tNF+ni c=1 sm=1 tr=0 ts=6a2ff103 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=jC_dHazF1ionUiSTUcYA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 4S7uljt5nHV0cwTy0T2uluz2XzmUOjtP
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDEzMiBTYWx0ZWRfX5imNFmiyqL4S
 Y9J650nQab9yQNmPhZPzlDc5cmyy/X9UHAiRVLrlGRsyCzBCoOBDy3eRhHDlU8fsi1Hmq/i3oBi
 Vq6+ect2fpj5wuX1Nya37eA1v9r/WDs=
X-Proofpoint-ORIG-GUID: 4S7uljt5nHV0cwTy0T2uluz2XzmUOjtP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDEzMiBTYWx0ZWRfX86qUXJslFrN7
 Z7JwulW8UNJD5WQVa3OUwjYx9CS3fggpgkbwEv28nzZxYV5RfDIJKXrmeG5IGV8pMgY9H2ZKYWI
 5AdhfMij/WCRhrNsL/oAHIA9GbzaLEiA0+9mS9rFHiM24yo2mRsj9E//ylWiDZgXvqasszUD/YO
 r+JmtUGF7ZAWhwAfVaXlUgD8tudJbu8cmLDnB6+ljcqLfUW5zrbJafaf9qFw++WVSWpkg1cXUlu
 7pHCoXKgvW1L4XQJ8Oz+id42HZwh6HzO3JS4OEpGOXC+f1H/8C4WhhKxPPC8g1XHrJi4YWl+RGi
 0Epbk/dNrCssCfXAj01pYg6TriBCEzbliA61pHtnNnxPfNRQxV1US0M/vhR8Czf3DaJ1AHWHdvA
 FkYMO8kJEQxhMWkvxJyBpUr9OfMxm0zzacHbmhSSiVEZGZnwYqNvbjyjXzfVM6Yz2U6GogIfxbQ
 v54LJwuDKzMxfRcEjjg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_03,2026-06-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150132
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_053308_897380_467909D6 
X-CRM114-Status: GOOD (  18.80  )
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

The Qualcomm extended CTI is a heavily parameterized version of ARM’s
CSCTI. It allows a debugger to send to trigger events to a processor or to
send a trigger event to one or more processors when a trigger event occurs
on another processor on the same SoC, or even between SoCs.

Qualcomm extended CTI supports up to 128 triggers. And some of the register
offsets are changed.

The commands to configure CTI triggers are the same as ARM's CTI.

Changes in v10:
1. rebase on top of linux-next-20260609.
2. patch 1: Add a bounds check in cti_allocate_trig_con() to guard
   against in_sigs / out_sigs exceeding nr_trig_max; carry forward
   Reviewed-by tag from v8/v9.
3. patch 2: Move __reg_addr(), cti_read/write_single_reg() helpers into
   coresight-cti.h as static inlines; add cti_read/write_single_reg_index()
   variants.
4. patch 3: Replace the direct CLAIMSET clear-to-zero with thin wrapper
   helpers (cti_claim_device, cti_disclaim_device_unlocked,
   cti_clear_self_claim_tag) that early-return when is_qcom_cti is set,
   bypassing claim operations entirely for Qualcomm CTIs. Fold qcom-cti.h
   into coresight-cti.h
5. patch 4: Add Reviewed-by tag.
6. patch 5: New patch. Document the banked trigger status and integration
   test registers added in patch 4 (triginstatus[1-3], trigoutstatus[1-3],
   ittrigin[1-3], ittrigout[1-3], ittrigoutack[1-3], ittriginack[1-3]).
   Also document the previously undocumented base integration test
   registers (itctrl, itchin, itchinack, ittrigin, ittriginack, itchout,
   itchoutack, ittrigout, ittrigoutack) introduced in kernel 5.7.

Changes in v9:
1. rebase on top of linux-next-20260518.
2. patch 2: Replace the "encode index into offset high bits" scheme with a cleaner
   __reg_addr(drvdata, off, index) helper; update cti_read/write_single_reg() to
   take separate off and index arguments; add u32 index field to cs_off_attribute
   (moved to coresight-priv.h); drop CTI_REG_SET/GET/CLR_NR macros and
   <linux/bitfield.h>; update commit subject accordingly.
3. patch 4: Add three index-aware sysfs macros (coresight_cti_reg_index,
   _rw_index, _wo_index); replace string-matching visibility logic with
   cs_off_attribute.index field check;
Link to v8 - https://lore.kernel.org/all/20260426-extended-cti-v8-0-23b900a4902f@oss.qualcomm.com/

Changes in v8:
1. Rebased on top of linux-next-20260424.
2. patch 1: Use devm_bitmap_zalloc() with nr_trig_max instead of per-connection
   signal counts; add bitmap_zalloc() for filter trigger group.
3. patch 2: Add #include <linux/bitfield.h>; move CTIINOUTEN_MAX expansion
   to patch3.
4. patch 3: wrap CLAIMSET clear with CS_UNLOCK/CS_LOCK; move CTIINOUTEN_MAX
   to 128 here with comment; fix macro alignment in qcom-cti.h.
5. patch 4: Make qcom_suffix_registers[] static.
Link to v7 - https://lore.kernel.org/all/20260325-extended_cti-v7-0-bb406005089f@oss.qualcomm.com/

Changes in v7:
1. Split the extended CTI support into smaller, logically independent
   patches to improve reviewability.
2. Removed the dual offset-array based register access used in v6 for
   standard and Qualcomm CTIs. Register addressing is now unified through
   a single code path by encoding the register index together with the base
   offset and applying variant-specific translation at the final MMIO
   access point. 
3. Removed ext_reg_sel, extend the CTI sysfs interface to expose banked 
   register instances on Qualcomm CTIs only. Numbered sysfs nodes are
   hidden on standard ARM CTIs, and on Qualcomm CTIs their visibility is
   derived from nr_trig_max (32 triggers per bank), ensuring that only
   registers backed by hardware are exposed.
Link to v6 - https://lore.kernel.org/all/20251202-extended_cti-v6-0-ab68bb15c4f5@oss.qualcomm.com/

Changes in v6:
1. Rename regs_idx to ext_reg_sel and add information in documentation
   file.
2. Reset CLAIMSET to zero for qcom-cti during probe.
3. Retrieve idx value under spinlock.
4. Use yearless copyright for qcom-cti.h.
Link to v5 - https://lore.kernel.org/all/20251020-extended_cti-v5-0-6f193da2d467@oss.qualcomm.com/

Changes in v5:
1. Move common part in qcom-cti.h to coresight-cti.h.
2. Convert trigger usage fields to dynamic bitmaps and arrays.
3. Fix holes in struct cti_config to save some space.
4. Revert the previous changes related to the claim tag in
   cti_enable/disable_hw.
Link to v4 - https://lore.kernel.org/linux-arm-msm/20250902-extended_cti-v4-1-7677de04b416@oss.qualcomm.com/

Changes in v4:
1. Read the DEVARCH registers to identify Qualcomm CTI.
2. Add a reg_idx node, and refactor the coresight_cti_reg_show() and
coresight_cti_reg_store() functions accordingly.
3. The register offsets specific to Qualcomm CTI are moved to qcom_cti.h.
Link to v3 - https://lore.kernel.org/linux-arm-msm/20250722081405.2947294-1-quic_jinlmao@quicinc.com/

Changes in v3:
1. Rename is_extended_cti() to of_is_extended_cti().
2. Add the missing 'i' when write the CTI trigger registers.
3. Convert the multi-line output in sysfs to single line.
4. Initialize offset arrays using designated initializer.
Link to V2 - https://lore.kernel.org/all/20250429071841.1158315-3-quic_jinlmao@quicinc.com/

Changes in V2:
1. Add enum for compatible items.
2. Move offset arrays to coresight-cti-core

Signed-off-by: Yingchao Deng <yingchao.deng@oss.qualcomm.com>
---
Yingchao Deng (5):
      coresight: cti: Convert trigger usage fields to dynamic
      coresight: cti: use __reg_addr() helper for register access
      coresight: cti: add Qualcomm extended CTI identification and quirks
      coresight: cti: expose banked sysfs registers for Qualcomm extended CTI
      coresight: cti: document banked and missing base CTI sysfs registers

 .../ABI/testing/sysfs-bus-coresight-devices-cti    |  90 ++++++++++++
 drivers/hwtracing/coresight/coresight-cti-core.c   | 153 ++++++++++++++-------
 .../hwtracing/coresight/coresight-cti-platform.c   |  26 ++--
 drivers/hwtracing/coresight/coresight-cti-sysfs.c  |  89 ++++++++++--
 drivers/hwtracing/coresight/coresight-cti.h        | 122 ++++++++++++++--
 drivers/hwtracing/coresight/coresight-priv.h       |   4 +-
 6 files changed, 404 insertions(+), 80 deletions(-)
---
base-commit: 49e02880ec0a8c378e811bc9d85da188d7c6204c
change-id: 20260611-extended_cti-dd4971ef98fa

Best regards,
-- 
Yingchao Deng <yingchao.deng@oss.qualcomm.com>


