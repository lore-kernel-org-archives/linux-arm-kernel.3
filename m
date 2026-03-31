Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 289CBFF60FF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Mar 2026 10:06:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=l6uIHY7AmL+0WdJn9rZatHTazNJPyFlb2TAmFbFEpLY=; b=xmTXoC+hZRdw4NuZV1F7qTVRoC
	zxoAboZ4PejSYO55jrQp9DuHUmJFmlCCRirirglLqSTK5EhFxTzU2/d/4VKamorUsnb5za9rsyRxK
	nawJazGH7rjpuRqHgL8kjcelA//HEveDm1VXBohjqM0Xc/Ch0SJXWdCMiEnVo7kp1PcqXeNoCk6ZY
	hRzueGSnLtpUTf/6LIQul1fy5dvMFQYcaceBio8mdlYtji/tAH6pa8eiSSgZ3PbucBhU7mZjo6UFb
	JvWPDnoGjvI+dAHvvn0xBa1C2ZqTKoJe0v7kg/UYE0QAiMytqNaQhwkpvXpMMGkcddRMBv5f+ZTSd
	37oWozgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Vz7-0000000Cjma-1fLT;
	Tue, 31 Mar 2026 10:06:09 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Vz5-0000000CjmD-0eYF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Mar 2026 10:06:08 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62V6mZrO2391396
	for <linux-arm-kernel@lists.infradead.org>; Tue, 31 Mar 2026 10:06:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=l6uIHY7AmL+0WdJn9rZatH
	TazNJPyFlb2TAmFbFEpLY=; b=UDeFoYZC3vcD31EiLbfQi89OF9MATHU+rjmMU9
	9eeD7JQGENuuHLVoYJfJZdg1zwbtQInLcS4/SYH56PtokNpjocrGT30NCQqtzhTz
	50U0O4Dvf9KJqQ56Ya7unr+d8IZB8ahG/JTfF78ONrga8uqDjGPbIbhIhhQBdFsL
	NZbWkbIGpLOUIZE8fmdib9fYcL7Izd+Duebavff9qg6oiHNXmt7jiMBKOsVCIdnE
	ow8PNDx0xWq5dzJhEEWD6XYIl2dDtnURQoJthYe685ghOyVLZbJcuupN5mBxDpmk
	FkTQdEllsXWlIGLK6nDJTNBmk6ffhPEeHaIEEF+gkigU649w==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7ue7m0sv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 31 Mar 2026 10:06:06 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-35d99c2908cso3233499a91.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 31 Mar 2026 03:06:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774951566; x=1775556366; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=l6uIHY7AmL+0WdJn9rZatHTazNJPyFlb2TAmFbFEpLY=;
        b=cVsVITHCdAsPTaQ0g9zISH9uFdqIQm5uCEacs6q6jHWbCj3xt//qsGY14+MZxYabYf
         FBeRk9lfJXyS9+wksVxRF2UeK/QTsv9eHJudPB/fHhzuo+tnunTRn6AjuFavst8R3AO4
         TXYwi9oy562tn1yQTHp80pIpm9Eeg/+fNKORy8IiT/x8F+Svu4DFbohYbXAzq0chc4Ie
         4/UBmnxTCe2OVwAneb/MWHuw56V3KXZMZC3U9yCuqQXnymlzcYPZ/ThSS/npk9LyUHXb
         BROET+WL5J1NjgkWxMKa7s6M1E76Z0xgxfKsWd21bpTA3gK4A1Ny3r0fiB0TOQRFxMIy
         u5Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774951566; x=1775556366;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l6uIHY7AmL+0WdJn9rZatHTazNJPyFlb2TAmFbFEpLY=;
        b=k2fh5IjsNM22dEyvygax7IyXFzzqiawKmYkfnEX+7oMw34yvMpiigdxznacyD+wBmN
         ScZ5spB3XhCp1Fncnay+s5he9fovY1200KHgOfeZ7m7UZv9HTv20wKJTaiFMma/jkkU4
         Kjkwwga/Gegb9mvX3SdxVgz+gCRcMYUeD9s78oa+8shtxeKqA/GItzMa1gSD9m2O1kCs
         U+i/gpJdeXyGVRBpQa0XDBk1VftbRE26JRDL4nf8UIJa42O+mX5eCUS2DH6Btp/xh8p6
         DHWOfZmOAxfGQtQEn9/CsNsRq3JWU/xNIZ5XJAdCJWY4sS1brHlY2uXfhNia3PXSj4HO
         we7Q==
X-Forwarded-Encrypted: i=1; AJvYcCUPhWXnYteWElxbSvHmTTFbLUvuO/c/Xl7tCV5NC4D0kIZDrW2yDz4tynSUH76CSBTYntDa5/EgMvg0EaObFE2h@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7MuzS6qLsBHyjm3VSTiT6N6Ae/YSpNQsvBBRPewld2oIfKY4G
	/rsKBf/+EW5k0G2rWODFnsiSsT4UhbTI+2kMpPtNcVjjyvjQdLA9Isx4IVxIu5P6pp+txMLaF2i
	ya01/4PCsek3sfZosmPh6Ur0WpiGFAxrUMu8E7NbynNdKxqhMsCcHpQz1ekhVPec5zd+AVWfTx4
	ZvLA==
X-Gm-Gg: ATEYQzzYRhD6/f5c00Ms0J7wxZdoQcyg6yKS74OeUmg0ilOecrxBJJhIJ8EjZVGLWrv
	aR1p54+JgXB+WtKda80unmYHqUn8LInmpbOnLwJ9wSMpuNTpCyraiEx/3159rr8sfusQ7b1W3/l
	ustVI/3TLG9gSy3oiTUK93For8jnnqTlls2711ddLW14krkc1z9tftzepZL3qJrsk2SCoNhOghz
	h516mwfICnXsHI4U7H5vHJdBLJYhH4qpRybbQSXaISzXIMgKHvYQ9B4kUYezrguKF3XwtfsJ3Lp
	MAsweI/+10Zx7tsRDIuNDD202JVIIkMocqHEiC0wy4TBSBwmeZSZxlJfZI+u93B+WpM++xJvEDZ
	rUDb+mnF/Z4gwyRDhrJOXHyE2/gTHnWqfiJkKezCqouTNE3zhAQMySzR604UVdjIngcTcmv+UbS
	TTnuIgMy8U
X-Received: by 2002:a17:90b:4b0e:b0:359:8e5e:43de with SMTP id 98e67ed59e1d1-35c300c19d2mr14606000a91.22.1774951565885;
        Tue, 31 Mar 2026 03:06:05 -0700 (PDT)
X-Received: by 2002:a17:90b:4b0e:b0:359:8e5e:43de with SMTP id 98e67ed59e1d1-35c300c19d2mr14605975a91.22.1774951565385;
        Tue, 31 Mar 2026 03:06:05 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35dbe41b11fsm1113255a91.0.2026.03.31.03.06.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 03:06:04 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 18:05:22 +0800
Subject: [PATCH v4] coresight: tpdm: add traceid_show for checking traceid
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260331-add-traceid-show-for-tpdm-v4-1-ed3dda24a562@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAGOcy2kC/43NwQ6CMAyA4VchO1sytjGJJ9/DeJhrkSXicMOpI
 by7g5MHY7w0+Zv068QiBUeR7YqJBUouOn/NoTYFs525ngkc5maCC81lpcEgwhiMJYcQO/+A1gc
 YB+yhaZArruuq5Zzl+yFQ656rfTjm7lwcfXitr5JYtv+oSUAFFZIVRm9JEe59jOXtbi7W932ZB
 1vwJD9AUf8CZQY5nRqpUZGV/As4z/Mbp/m/qhoBAAA=
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>,
        Mao Jinlong <quic_jinlmao@quicinc.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774951561; l=5112;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=N3pEciTN7LAj4w8dB8lZ5jPdogjT7WW8uSDNMu9Z0wU=;
 b=JIRXGEOZII6vFBJQCfyfjhy6mSdjZwdCWfIt2FORY+p3PAa3p/u3a6c3eLt7aTXHOt55otoKk
 fjlgFqwEs2BCOguBldvjeQ+XPffXxMdIiCDPdhsLLzPm02NFRiyj2x7
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDA5NyBTYWx0ZWRfX4DXRj9M2TfSK
 E3qDTNf0J7nyRwYZ0qqhUcKQ1PsHTuk0zIWQpIS69lBsPLJue3zy7ufQpNNuu3hds0Nv8L2rvY6
 OARfaP/etJEQ52E57dTKNgUZp1/t2/SjaA4o0YKQyrfM0fuscJa0wDnS5EO+w9bPRRlxuwcL4hE
 DXdGxG6Lfhlisn4XnPxUtrya0KprXTd6RxMarOxP8yzq0O6Ee40wFmFtx56UA3tu0UXreFS04d0
 QM8P0zfuyw7DBaHPzzrCTvKXSGIoUWV83XLJ+DagsEg2nQZZAKFUn4oqUyiXK8ZEzZf0MNYfp6N
 ls8VhL1n8HlgS4x9WZ1pAVtmOTgXWFUf1IXrQceZ/yxWzdsAfUXywRjEAqSrXDBLIohmTEoTXq9
 nu8ZrgWA7Xab0mf4Xi96f+0i6XPFdNS0iS0Y8K46UOYHxUHkuFPl+XxOefuwq3veBp7Vl/Qxaxx
 kPt6OkI1B3SLJbTg73Q==
X-Proofpoint-GUID: sSMGCvn371YFRPKexYY-x_fFvcV44J04
X-Authority-Analysis: v=2.4 cv=G7sR0tk5 c=1 sm=1 tr=0 ts=69cb9c8e cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=XokCWNFOrc6Ss69DZKAA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: sSMGCvn371YFRPKexYY-x_fFvcV44J04
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_02,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 spamscore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603310097
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_030607_206285_43BC0B32 
X-CRM114-Status: GOOD (  21.72  )
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

Save the trace ID in drvdata during TPDM enablement and expose it
to userspace to support trace data parsing.

The TPDM device’s trace ID corresponds to the trace ID allocated
to the connected TPDA device.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
Changes in v4:
1. Return -EINVAL if the traceid is 0.
- Link to v3: https://lore.kernel.org/r/20260325-add-traceid-show-for-tpdm-v3-1-0eb836d4ec30@oss.qualcomm.com

Changes in v3:
1. Only allow user to read the traceid while the TPDM device is enabled.
- Link to v2: https://lore.kernel.org/r/20260316-add-traceid-show-for-tpdm-v2-1-1dec2a67e4ed@oss.qualcomm.com

Changes in V2:
1. Use sysfs_emit instead of sprintf.
Link to V1 - https://lore.kernel.org/all/20260306-add-traceid-show-for-tpdm-v1-1-0658a8edb972@oss.qualcomm.com/
---
 .../ABI/testing/sysfs-bus-coresight-devices-tpdm   | 10 +++++++
 drivers/hwtracing/coresight/coresight-tpdm.c       | 34 +++++++++++++++++++++-
 drivers/hwtracing/coresight/coresight-tpdm.h       |  2 ++
 3 files changed, 45 insertions(+), 1 deletion(-)

diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpdm b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpdm
index f8016df64532..bc36ba32c900 100644
--- a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpdm
+++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpdm
@@ -278,3 +278,13 @@ Date:           Aug 2025
 KernelVersion   6.18
 Contact:        Mao Jinlong <quic_jinlmao@quicinc.com>
 Description:    (Read) Show hardware context information of device.
+
+What:		/sys/bus/coresight/devices/<tpdm-name>/traceid
+Date:		March 2026
+KernelVersion:	7.1
+Contact:	Jie Gan <jie.gan@oss.qualcomm.com>
+Description:
+		(R) Show the trace ID that will appear in the trace stream
+		coming from this TPDM. The trace ID is inherited from the
+		connected TPDA device and is fixed for the lifetime of the
+		device. Returns -EINVAL if the device has not been enabled yet.
diff --git a/drivers/hwtracing/coresight/coresight-tpdm.c b/drivers/hwtracing/coresight/coresight-tpdm.c
index da77bdaad0a4..9b16f368a58b 100644
--- a/drivers/hwtracing/coresight/coresight-tpdm.c
+++ b/drivers/hwtracing/coresight/coresight-tpdm.c
@@ -481,7 +481,7 @@ static void __tpdm_enable(struct tpdm_drvdata *drvdata)
 
 static int tpdm_enable(struct coresight_device *csdev, struct perf_event *event,
 		       enum cs_mode mode,
-		       __maybe_unused struct coresight_path *path)
+		       struct coresight_path *path)
 {
 	struct tpdm_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
 
@@ -497,6 +497,7 @@ static int tpdm_enable(struct coresight_device *csdev, struct perf_event *event,
 	}
 
 	__tpdm_enable(drvdata);
+	drvdata->traceid = path->trace_id;
 	drvdata->enable = true;
 	spin_unlock(&drvdata->spinlock);
 
@@ -693,6 +694,29 @@ static struct attribute_group tpdm_attr_grp = {
 	.attrs = tpdm_attrs,
 };
 
+static ssize_t traceid_show(struct device *dev,
+			    struct device_attribute *attr, char *buf)
+{
+	unsigned long val;
+	struct tpdm_drvdata *drvdata = dev_get_drvdata(dev->parent);
+
+	val = drvdata->traceid;
+	if (!val)
+		return -EINVAL;
+
+	return sysfs_emit(buf, "%#lx\n", val);
+}
+static DEVICE_ATTR_RO(traceid);
+
+static struct attribute *traceid_attrs[] = {
+	&dev_attr_traceid.attr,
+	NULL,
+};
+
+static struct attribute_group traceid_attr_grp = {
+	.attrs = traceid_attrs,
+};
+
 static ssize_t dsb_mode_show(struct device *dev,
 			     struct device_attribute *attr,
 			     char *buf)
@@ -1367,6 +1391,12 @@ static const struct attribute_group *tpdm_attr_grps[] = {
 	&tpdm_cmb_patt_grp,
 	&tpdm_cmb_msr_grp,
 	&tpdm_mcmb_attr_grp,
+	&traceid_attr_grp,
+	NULL,
+};
+
+static const struct attribute_group *static_tpdm_attr_grps[] = {
+	&traceid_attr_grp,
 	NULL,
 };
 
@@ -1425,6 +1455,8 @@ static int tpdm_probe(struct device *dev, struct resource *res)
 	desc.access = CSDEV_ACCESS_IOMEM(base);
 	if (res)
 		desc.groups = tpdm_attr_grps;
+	else
+		desc.groups = static_tpdm_attr_grps;
 	drvdata->csdev = coresight_register(&desc);
 	if (IS_ERR(drvdata->csdev))
 		return PTR_ERR(drvdata->csdev);
diff --git a/drivers/hwtracing/coresight/coresight-tpdm.h b/drivers/hwtracing/coresight/coresight-tpdm.h
index 2867f3ab8186..11da64e1ade8 100644
--- a/drivers/hwtracing/coresight/coresight-tpdm.h
+++ b/drivers/hwtracing/coresight/coresight-tpdm.h
@@ -300,6 +300,7 @@ struct cmb_dataset {
  * @cmb         Specifics associated to TPDM CMB.
  * @dsb_msr_num Number of MSR supported by DSB TPDM
  * @cmb_msr_num Number of MSR supported by CMB TPDM
+ * @traceid	Trace ID of the path.
  */
 
 struct tpdm_drvdata {
@@ -313,6 +314,7 @@ struct tpdm_drvdata {
 	struct cmb_dataset	*cmb;
 	u32			dsb_msr_num;
 	u32			cmb_msr_num;
+	u8			traceid;
 };
 
 /* Enumerate members of various datasets */

---
base-commit: b84a0ebe421ca56995ff78b66307667b62b3a900
change-id: 20260316-add-traceid-show-for-tpdm-88d040651f00

Best regards,
-- 
Jie Gan <jie.gan@oss.qualcomm.com>


