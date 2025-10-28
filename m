Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74D1FCCF9F2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 06:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KQofei2Qtb3/fc9/OOdfFiIGqr7PeTuj1JzH6Vy6LU4=; b=4cP8RqvUS7Bzs6hcxamo5RKW+A
	Amnxt5IOSrtlr+aKKWGhIl26vxuYd4/ISJaW6bvwgXzajDzSj9/72JGaILiyYv6MT9SqBE+GRspLk
	HL8Zta9mN6+Bh+Zaa+v2T2mguRizethlHJvo8ClESOvDCBIXwRWkWAS/jXt8OZmLEws1sLPXDgKUJ
	btfwlo4LZlPJuC8t1UYcaw86UP/oA05EfPnhW/+r1MrS7L7H855KLTcqufBi7xJwi5ULEDdqMGHrg
	b1okq7sEyd+02wyuglCyLDQ3pB2osgcXmZC1xDU85lS/mAnkQ4MW8qCuHV3JvnoRHqQLE8x1nNKRe
	rHFsb/Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDdCE-0000000FLCm-1Wgr;
	Tue, 28 Oct 2025 06:28:42 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDdC2-0000000FL2p-1ioz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Oct 2025 06:28:31 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59S31wXW353480
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Oct 2025 06:28:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KQofei2Qtb3/fc9/OOdfFiIGqr7PeTuj1JzH6Vy6LU4=; b=lCmomKmx+AQxl0+i
	c7wXw0zJ9vkt+IMOZRnaJHPcnMSPNkg5Qv+H3Va4gry/CRmsqCqZLfigSrmudWbx
	RYtnOb0y0pqPf726A829oX7IwoxGGOpROmraiDtsxomApQ46ylIw/JeTMcnhpQr/
	D/pSl6R8lAdbQPhd3cJEuK/dow0mQNWVFAcFHfPW+fvVXiUlDnERGBpDYSZndTOW
	91JIUybbCXXmEDW5np3rkL86c6iMEwpAhaByWOD8GsNuRkbFqOItSfOFd3TxSQQj
	B0YDjN8WoXqu4bJGxCnBG0nZjAKSLoKEiRSWUflo43Jvg0bGrLlRU5oeRpGzQ1iV
	sDuM/Q==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a2njrrfvx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Oct 2025 06:28:29 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-26983c4d708so42596425ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Oct 2025 23:28:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761632909; x=1762237709;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KQofei2Qtb3/fc9/OOdfFiIGqr7PeTuj1JzH6Vy6LU4=;
        b=t3WfDY5Sb8adXEH+e7k/Uy+UQD3aI/v5NmYf9m/n8cPs8lWbN/4TIsAVUEjOqcsvlV
         FdhGmW675kL/rdP2yC3dHbbTeGAva945C/tWXCsAxJTN2f1f3+VpWeugiT6nKpxEU627
         dL0EfSjHvUUV/YS9dkS5lYE91C19W6MFTAC8SIW3o8TPvyw/PRzZlLHQjpu+okZpsc/X
         6ByWGtuQF6Kmtp9FhB0nYyjj0PPVNFszPHN/ydMJXTQJe4IO3NL7IVA/i0HuVTLBcCZ3
         H34tiefTiq6o6UrKwBey0dG/TSIxcXqoCOIF2PjMW+VTbV1zgGokAhxjg8FOc/TltXgo
         aU4Q==
X-Forwarded-Encrypted: i=1; AJvYcCXIiBabAScVz1RfxpU/XDcJ6AVG7cRrTmTvfAhiJf2y2Xa01+eNEkP19AhCA8oCQT9NdnAYRNove1+rcTXGXuU8@lists.infradead.org
X-Gm-Message-State: AOJu0YypTdespJxapkkArOJXnlt1jidbj+tnbO5wKmMHV8eCZUmu1n8Y
	7jpFRO7FRy0Y9QD0w9tAKsedYxtJlBMPqcBhr8JERfhPSEx3O5Q6e73CS0ztLiTt/vhzhNjck57
	C2UZCa0EyLiVWJhmtZZl3qB9dSNW7uq9FAzjh3eN3MhomJ3XVgLs4H8A2R2Gu/iV2edKKfEYpE3
	QLng==
X-Gm-Gg: ASbGncurMU5qKh70fDTXFb6icwlRZMtAbxqxh8JEdafHbxFBTVuyhxM4WYPRTqmm2o2
	JX9taCMLwbK0OksOuVXTsuixtlNdYw5SvlUNP82oSvIpiHWe1fadhx+QFfSDarkHw0IYcaDvaxT
	ijibrio/XrumpogEqFB+3Nrughpinqx3bdu/TCOd1EIQ96gFFg0du/1cFPEcYPOIOortsa8a/ad
	yqSU0vmZjG8N2JG2NFDT/46/YXTXD/2pvBD5gcArzIhMCkQd6w2EjYkGAmoEoSmwBHmm5N9f0eZ
	eXKBmWFl5x+buaO68J+9Iu0dt+CVCdzlHKh+XszgTZ1qH8vzOnV6OLyFLts29RBp5C/QD1CgIuj
	5eFP4rrZcAH365eiTmcMuG5l+EG9GT47pOQWmpG4UnEd4Rrt7RbqVj2B8
X-Received: by 2002:a17:903:3807:b0:246:4077:4563 with SMTP id d9443c01a7336-294cb3ecab4mr26187695ad.34.1761632909173;
        Mon, 27 Oct 2025 23:28:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH6f9kUv+g7lTZRr/w2s7f85BFO7ewE4rauIzo98Jb0MJ2ypkDr3EEQ3p3gGsFjtzw+C9d7QA==
X-Received: by 2002:a17:903:3807:b0:246:4077:4563 with SMTP id d9443c01a7336-294cb3ecab4mr26187265ad.34.1761632908674;
        Mon, 27 Oct 2025 23:28:28 -0700 (PDT)
Received: from hu-yuanfang-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498cf359asm102503265ad.12.2025.10.27.23.28.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 23:28:28 -0700 (PDT)
From: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Date: Mon, 27 Oct 2025 23:28:12 -0700
Subject: [PATCH 10/12] coresight-tmc: Handle delayed probe for CPU cluster
 TMC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251027-cpu_cluster_component_pm-v1-10-31355ac588c2@oss.qualcomm.com>
References: <20251027-cpu_cluster_component_pm-v1-0-31355ac588c2@oss.qualcomm.com>
In-Reply-To: <20251027-cpu_cluster_component_pm-v1-0-31355ac588c2@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Leo Yan <leo.yan@linux.dev>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: kernel@oss.qualcomm.com, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761632890; l=4560;
 i=yuanfang.zhang@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=R098UnmnSwcFWaM8MpFroDz5io13u7mQq3HuEtEMZPQ=;
 b=MK+gKR6IN2X24uvIWsY1xMXMxIZVE842wcZNNGnkMgKDPzom+ZSefRVoWMjEy40EWHpewtHLU
 g/QLL+O0JUHDC47/muwhdHuzpoFCd9dPIxzXJTfb33k1SkspAMh9EPN
X-Developer-Key: i=yuanfang.zhang@oss.qualcomm.com; a=ed25519;
 pk=9oS/FoPW5k0CsqSDDrPlnV+kVIOUaAe0O5pr4M1wHgY=
X-Authority-Analysis: v=2.4 cv=dqvWylg4 c=1 sm=1 tr=0 ts=6900628d cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=fD5cxDGOUVrWaoTO3WMA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: wM2VRWxgDYSAgTlR6C7wnV6Q9IVtKGv7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDA1NCBTYWx0ZWRfXzTSO92fPbzA0
 8MM8ENbzCJZYjXqdo0QPDo3WQIYue6C+eBLzorS4X9LeyUJsZ54AsLyyV1zJcpQ1B1OtAAdN+OW
 5tq/SiaATp5F8YPONL3gAa/A/kaGK2nYBKfW8zNjU3SNCmFXwXazh8y5tf7Q+tM07DtGVWpBkWG
 v66Nvx8mjS8sQnNCIMI1fuj4DXSur03WuUwXxgiJWt+14kz6HEyEoftQv7DsTnq010WGuicxn2X
 01Xb0xkeBjucOE2Ra/NLvUD9u6S8YCpoLLz/WOGovq3mSNrymR4xL2/+xyp/qvMVlKKbE3A5BS8
 PoHpWah+XcBs7zY3Z4B4ezo5sdvNww8AjgaNbJXHykfS0W14VfIEDV5eO4v6X0RxmsYyhCMt2pe
 4b7The0IZOTto+JwrpfCt/Lm/bmyww==
X-Proofpoint-ORIG-GUID: wM2VRWxgDYSAgTlR6C7wnV6Q9IVtKGv7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_03,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 spamscore=0 suspectscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510020000
 definitions=main-2510280054
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_232830_469967_DF44C276 
X-CRM114-Status: GOOD (  23.60  )
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

Delay probe the cpu cluster TMC when all CPUs of this cluster are
offline, re-probe the funnel when any CPU in the cluster comes online.

Key changes:
- Introduce a global list to track delayed TMCs waiting for CPU online.
- Add CPU hotplug callback to retry registration when the CPU comes up.

Signed-off-by: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-tmc-core.c | 59 +++++++++++++++++++++++-
 drivers/hwtracing/coresight/coresight-tmc.h      |  4 ++
 2 files changed, 61 insertions(+), 2 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
index 685a64d8ba1b5df4cff91694eee45c6d6a147bc1..7274ad07c2b20d2aa6e568b4bab0fbb57e331ab8 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-core.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
@@ -36,6 +36,9 @@
 DEFINE_CORESIGHT_DEVLIST(etb_devs, "tmc_etb");
 DEFINE_CORESIGHT_DEVLIST(etf_devs, "tmc_etf");
 DEFINE_CORESIGHT_DEVLIST(etr_devs, "tmc_etr");
+static LIST_HEAD(tmc_delay_probe);
+static enum cpuhp_state hp_online;
+static DEFINE_SPINLOCK(delay_lock);
 
 int tmc_wait_for_tmcready(struct tmc_drvdata *drvdata)
 {
@@ -1028,6 +1031,8 @@ static int __tmc_probe(struct device *dev, struct resource *res)
 		if (!drvdata->cpumask)
 			return -EINVAL;
 
+		drvdata->dev = dev;
+
 		cpus_read_lock();
 		for_each_cpu(cpu, drvdata->cpumask) {
 			ret = smp_call_function_single(cpu,
@@ -1035,11 +1040,16 @@ static int __tmc_probe(struct device *dev, struct resource *res)
 			if (!ret)
 				break;
 		}
-		cpus_read_unlock();
+
 		if (ret) {
+			scoped_guard(spinlock,  &delay_lock)
+				list_add(&drvdata->link, &tmc_delay_probe);
+			cpus_read_unlock();
 			ret = 0;
 			goto out;
 		}
+
+		cpus_read_unlock();
 	} else {
 		tmc_init_hw_config(drvdata);
 	}
@@ -1104,8 +1114,12 @@ static void __tmc_remove(struct device *dev)
 		misc_deregister(&drvdata->miscdev);
 	if (drvdata->crashdev.fops)
 		misc_deregister(&drvdata->crashdev);
-	if (drvdata->csdev)
+	if (drvdata->csdev) {
 		coresight_unregister(drvdata->csdev);
+	} else {
+		scoped_guard(spinlock,  &delay_lock)
+			list_del(&drvdata->link);
+	}
 }
 
 static void tmc_remove(struct amba_device *adev)
@@ -1224,14 +1238,55 @@ static struct platform_driver tmc_platform_driver = {
 	},
 };
 
+static int tmc_online_cpu(unsigned int cpu)
+{
+	struct tmc_drvdata *drvdata, *tmp;
+	int ret;
+
+	spin_lock(&delay_lock);
+	list_for_each_entry_safe(drvdata, tmp, &tmc_delay_probe, link) {
+		if (cpumask_test_cpu(cpu, drvdata->cpumask)) {
+			list_del(&drvdata->link);
+
+			spin_unlock(&delay_lock);
+			ret = pm_runtime_resume_and_get(drvdata->dev);
+			if (ret < 0)
+				return 0;
+
+			tmc_init_hw_config(drvdata);
+			tmc_clear_self_claim_tag(drvdata);
+			tmc_add_coresight_dev(drvdata->dev);
+			pm_runtime_put(drvdata->dev);
+			spin_lock(&delay_lock);
+		}
+	}
+	spin_unlock(&delay_lock);
+	return 0;
+}
+
 static int __init tmc_init(void)
 {
+	int ret;
+
+	ret = cpuhp_setup_state_nocalls(CPUHP_AP_ONLINE_DYN,
+					"arm/coresight-tmc:online",
+					tmc_online_cpu, NULL);
+
+	if (ret > 0)
+		hp_online = ret;
+	else
+		return ret;
+
 	return coresight_init_driver("tmc", &tmc_driver, &tmc_platform_driver, THIS_MODULE);
 }
 
 static void __exit tmc_exit(void)
 {
 	coresight_remove_driver(&tmc_driver, &tmc_platform_driver);
+	if (hp_online) {
+		cpuhp_remove_state_nocalls(hp_online);
+		hp_online = 0;
+	}
 }
 module_init(tmc_init);
 module_exit(tmc_exit);
diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
index f5c76ca2dc9733daa020b79b1dcfc495045a2618..29ccf0b7f4fe90a93d926a2e273950bce9834336 100644
--- a/drivers/hwtracing/coresight/coresight-tmc.h
+++ b/drivers/hwtracing/coresight/coresight-tmc.h
@@ -246,6 +246,8 @@ struct tmc_resrv_buf {
  * @cpumask:	CPU mask representing the CPUs related to this TMC.
  * @devid:	TMC variant ID inferred from the device configuration register.
  * @desc_name:	Name to be used while creating crash interface.
+ * @dev:	pointer to the device associated with this TMC.
+ * @link:	link to the delay_probed list.
  */
 struct tmc_drvdata {
 	struct clk		*atclk;
@@ -279,6 +281,8 @@ struct tmc_drvdata {
 	struct cpumask		*cpumask;
 	u32			devid;
 	const char		*desc_name;
+	struct device		*dev;
+	struct list_head	link;
 };
 
 struct etr_buf_operations {

-- 
2.34.1


