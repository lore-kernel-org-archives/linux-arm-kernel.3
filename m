Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA4C7CCD199
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 07:12:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=HhMQHdyowb7xUpeNi0bgpjT91L88WXtkBbN1nNa/hus=; b=20wMBKuafeZ52Q
	833wC4KAWWSfH30QDZJDenVBXEaWONMQJ1FF4l7um4vdGaN4Ltv0Ht1Tqpsmnb5IkvCXWdxW9uElM
	CBlbhjBH16kgMVjcVWCVDMoN8IkbcdVxbKcATCR8nw09ipg9AQyfgYhILH6o8dYn60Innf8R7YW65
	lfIrrD4gB31U0MpG81Ynb2DR9vEZTWkrMUJ6ZL5Zupgox4OypgA0FdLNJnUEVLDpTBqqXmbfEnNN9
	2MyWy++urLh8CMk15BSGG241STn7uClE3FuMmige/BouVBo4PW7FRsFzz2oVFz9Z6tcVHD5AehpC7
	B0ljabwZIntRZRDHsDmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAk4P-0000000C9tN-1yZs;
	Mon, 20 Oct 2025 07:12:41 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAk4M-0000000C9rL-0x5v
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 07:12:39 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59JMgNUX002929
	for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Oct 2025 07:12:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=HhMQHdyowb7xUpeNi0bgpj
	T91L88WXtkBbN1nNa/hus=; b=mjwSR7D3E+p38VdFNr7MP4UDXEmPCb85YTCVtD
	y74EaQVHssAcC6zdL67x6HBSjakYS/FiVe7hU3n0+xSUuDZxo2XzwKrHRlmxLvpR
	ZO+72Rju+CdNUaQ/eVPDC30cf5hPy9HoMmPnNHUQMGDe9CPCWySnjy3S90SNRrdB
	dVNGpp08PrtNhI0iHLwooKrLCfjqkkeM4xDDtA2NpqZTDeJ3EcMd0nAZ/30DSm82
	3skZofXSWNle3YLlow8f+czoWSKkIuYQW5pkF0DUlrT3g8HtVJlQyzDY2N8RZEQy
	ig7i9mhi+HOZbKfhDp/R4wn/bcWzPzmYTCRwkQVOv35TmZAQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49w08w1j5g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Oct 2025 07:12:33 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-781269a9049so7068656b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Oct 2025 00:12:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760944352; x=1761549152;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HhMQHdyowb7xUpeNi0bgpjT91L88WXtkBbN1nNa/hus=;
        b=Rp8FFgsxJXWj2V0rI9lbYlsWJTBgwK0xopXwz2RoWi8rf3NdYD1CaF54SMNrr/nWSn
         OldV+gy+9rubllDvXEWhNYCXzsLT74/WCf922hNZch3PQtyKmc23RaftTQE76ETdYXdB
         iaW7D2cMPTqdM2ut8Jf+r/pKMyRx7/SpiPank8Ym1es+fccHV6RH1tGWfoLwt75hyh7K
         rAQmGqNBDEjxXF/yDJPlYdRahGjNT8msTTHnTgyXzXCJ/LaRRrpkwPFr3VW3hgDO7S5u
         ZO2ZQ6tNfWlBVLMvxusJ95+Vnr9qntJlhfcGo3O1pgmx10ZOoSZum4LSP79iwFsoOEU4
         tpeA==
X-Forwarded-Encrypted: i=1; AJvYcCWPVsWp1LMAdBUKJFYsrbxQKFC0ZAWid3290XM1wpfpcYkk0Vg3S21KDvyxmDnOqj732PKISPBz74oihATBLn07@lists.infradead.org
X-Gm-Message-State: AOJu0YwzzisNjiU9Hd3M2+c0U1jQUkNqKui44dfPJErg4zFAR0i5GwoB
	FAziHq1mZJXn/fNLzeUI4K5FzpDa69UWaL2irkbCuJ7ep8XdtYuroGcBuJ/Rj/BYQqWKnuHfHoo
	+tzmLYnKaRHTWigjJa2oTyax642Y3BLcsR2vBwtMjtM7VmhKgZnuysDSCPQ/tggGw37kBCs4Yct
	Frtw==
X-Gm-Gg: ASbGnct+YcO9Ct6YxCCbu2TrhFd/rOe0RDwiiIe+iHsg4beDOo8ZBzF2oJgS4DJTuZt
	k6Cs/UiqsegR2ppXKhI+uUaSkiUI4Ui/8qOQEDNkoczrvpnQF4Q2QzIenVmtSq/5HLqVf8dZOIn
	kMJDsg7de686kth5WvqHXjl3ZmdJKZrFQpHv4w+U02MMUCj1NXjrCfslR1R14xl/eX2px0sgWXp
	uhHOHYmUBw9rfFPgRvw85dmcvCms21Z165iZpuwY5ZwTtpT1H82JQ3bnllMdagfX3ejDNTwxHX9
	zYxk8pI21PpIHRN6fyUp2qahGgNBek6WGgdSamRABixHItMRmqajG6wpaD1ETaDUrFJG6Uc0b5+
	ragsL3dIqx6I9hlyQbQojNW+UvFXzhKm6O1KFDj8bD5WB+AV0ZXrr/NGsZyxYrFXGhCE=
X-Received: by 2002:a05:6a00:a589:b0:77d:51e5:e5d1 with SMTP id d2e1a72fcca58-7a220d2328emr14099376b3a.19.1760944352517;
        Mon, 20 Oct 2025 00:12:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHFID509bQvDFsXjXcGYMaFoQ+T7rxmZHSka4oAHjXjgLq3rPIpVaEsQB57crWkg6D+gsbiDA==
X-Received: by 2002:a05:6a00:a589:b0:77d:51e5:e5d1 with SMTP id d2e1a72fcca58-7a220d2328emr14099350b3a.19.1760944352083;
        Mon, 20 Oct 2025 00:12:32 -0700 (PDT)
Received: from jinlmao-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a22ff34b8bsm7421705b3a.22.2025.10.20.00.12.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 00:12:31 -0700 (PDT)
From: Yingchao Deng <yingchao.deng@oss.qualcomm.com>
Subject: [PATCH v5 0/2] Add Qualcomm extended CTI support
Date: Mon, 20 Oct 2025 15:11:59 +0800
Message-Id: <20251020-extended_cti-v5-0-6f193da2d467@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAL/g9WgC/5XM3wqCMBTH8VeJXTfZptPZVe8REvtzloN05UwM8
 d2bQhdRCN0c+B34fCcUoHMQ0GE3oQ4GF5xv4+D7HdK1bC+AnYkbMcI4JTTHMPbQGjBn3TvMZMZ
 yLUSZKYoiuXVg3bjmTlXctQu9755rfeDL9x0qPkMDxwQX1ljKMwNUiqMPIbk/5FX7pkniWfIb1
 kpWCmooqML+a7nUqdIlT601G5aRH1ZlnGmVRsryb1vN8/wCiTU5aGMBAAA=
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        quic_yingdeng@quicinc.com, Jinlong Mao <jinlong.mao@oss.qualcomm.com>,
        Yingchao Deng <yingchao.deng@oss.qualcomm.com>,
        Jinlong Mao <jinglong.mao@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760944348; l=2524;
 i=yingchao.deng@oss.qualcomm.com; s=20250721; h=from:subject:message-id;
 bh=yhbzLWKuK4Svb/ypqnYVgYxI5JXJOXYx2TNvuTsDn84=;
 b=j74nyX9FlZ3fACAGB0SEF2T6/NpdepyK6MotE+or3WzBWOv+hMLcqiEn+jcmjgsyoMLCOO+IH
 EFhzLZo2hgVCeXWJonoomAMqOn9+jN/TTBSnI1eQzer/UFBGAukXA0M
X-Developer-Key: i=yingchao.deng@oss.qualcomm.com; a=ed25519;
 pk=1zkrZnKgKCu3VxiiiGfzpW3KL9RNP/qun1frl0ozUIc=
X-Proofpoint-ORIG-GUID: eI8_I8PEwsawdDBcZpvBuoMij3y34gnz
X-Proofpoint-GUID: eI8_I8PEwsawdDBcZpvBuoMij3y34gnz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE5MDA5MCBTYWx0ZWRfX/J9LYIkZf5QJ
 hi6RIUFWf6f7Nkzqap5n8mZhBaToaZWCWnKYTOMLqs88Mm4CmmiEjrNZ0TRD03ojG0ebKEd5c02
 N06r4YAgIAQEMUJcNSla56ciEZpLJi2hITga9hW8OKpJjkCwOUsdCNlr4ZJRub3pi0APXW+cdok
 Tp6RZLVixknz7dQcDAg+ny4vMtKdR94clVMUoITBiItV1j5gYT687QPNo8MEdAMJTqgiaUxpulX
 Yarsst946XH0NNQaiEZxENB2wRpodqjE4ucW2uxUSDmgTqCj4rJnyUkJzlrEJGVTkgqwpiWtbL6
 APq3pzzprbTwkR00VJxZhuODPjlKCahL5LUhYfHALt6UGAyAjRNTtYUbI2P++ilOvFqE4pNS/CY
 lY4COURJ1EDH9Tc9ERp2dVUjOboQgg==
X-Authority-Analysis: v=2.4 cv=V5NwEOni c=1 sm=1 tr=0 ts=68f5e0e1 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=nlyGTqwaJupNnBHl5SIA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-20_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 spamscore=0 suspectscore=0 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510190090
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_001238_267381_DBDF05EB 
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

The QCOM extended CTI is a heavily parameterized version of ARM’s CSCTI.
It allows a debugger to send to trigger events to a processor or to send
a trigger event to one or more processors when a trigger event occurs on
another processor on the same SoC, or even between SoCs.

QCOM extended CTI supports up to 128 triggers. And some of the register
offsets are changed.

The commands to configure CTI triggers are the same as ARM's CTI.

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

Signed-off-by: Jinlong Mao <jinlong.mao@oss.qualcomm.com>
Signed-off-by: Yingchao Deng <yingchao.deng@oss.qualcomm.com>
---
Yingchao Deng (2):
      coresight: cti: Convert trigger usage fields to dynamic bitmaps and arrays
      coresight: cti: Add Qualcomm extended CTI support

 drivers/hwtracing/coresight/coresight-cti-core.c   | 144 +++++++++++++---
 .../hwtracing/coresight/coresight-cti-platform.c   |  16 +-
 drivers/hwtracing/coresight/coresight-cti-sysfs.c  | 184 +++++++++++++++------
 drivers/hwtracing/coresight/coresight-cti.h        |  60 ++++++-
 drivers/hwtracing/coresight/qcom-cti.h             |  29 ++++
 5 files changed, 346 insertions(+), 87 deletions(-)
---
base-commit: 1fdbb3ff1233e204e26f9f6821ae9c125a055229
change-id: 20251016-extended_cti-2a426c8894b1

Best regards,
-- 
Yingchao Deng <yingchao.deng@oss.qualcomm.com>


