Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25F0BC982DA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 09:30:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=csYgVbrv8TseQaIQhbFcx/zPAvB5tHhPbrMBPJ1Wxu4=; b=PWUSyxgE0HcHsOtYPxJFQP6k/D
	8MUMGrqRo8Kxs7i6Rn+p/gdld8Fl3xx6//6RBgkncyNfDMnfylOtmyIzkUWaS5N3AoWRIXUT61L4U
	3iCZMZtJrCyFYEJPocls2+PBaijF9Q4uPaY8ExC1dYI+zryWZ+IuAXGcW+BfDCgresGt1NGoA4WH9
	i5iov6eWDZWFNgaQp9rjUYGt6nH/flHqJ5xpYsfNWeov/q4348P8V5Wvg6YFuGFZTSBttR1TuPIkN
	VcrpQ6/daqKLg7dAf+ukmuy1aKMVqmgt6Za1z55HQ14E0bV0u89l1rACbFW+MQNYRxvXsdReQ8O9d
	LeqMHNiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Uv4-0000000Dww9-2pU1;
	Fri, 18 Sep 2026 09:30:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Uuy-0000000DwuE-3vT5
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 18 Sep 2026 09:30:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=csYgVbrv8TseQaIQhbFcx/zPAvB5tHhPbrMBPJ1Wxu4=; b=CIWxnWLh41Qg/FkL6ZqsB59SUV
	F0Iv4WCuqLdkUFwOSCfndq6WejZ9AF69GTk+TLPp5gJpYlp2uoB5lBqP/PRlVPWD2b6kR2DdfmQPO
	f61H1Kax/z1n4/DQu+BaSyxivebS6hIfWpF8xdd8j5AH6btCfAfhXboFFFvy2fFg17Lo7Z9IeKMs/
	XAdP9GHOVADpVFegRFKzQrmJTbAYfOCTHTb6SVhG2+BkLN2M9ogPdFjWnem22BKc/McdJ2hZ3hicm
	3S9s9zldzYcJiA/EgfTaY10F8Zc+T8afbGY7lW5fpX5tIMCyGH+NW8RTHRl5U9CHaP6HgjfurTReb
	5THh/WKQ==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x7Uuv-00000009rP4-3vgf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 09:30:03 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68I603Ut3423743
	for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Sep 2026 09:29:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=csYgVbrv8Ts
	eQaIQhbFcx/zPAvB5tHhPbrMBPJ1Wxu4=; b=mCZE6l73Y99dQjjmqPKu2F13UgC
	Q8V6oDKEg/X6rz6xoc1GT1KKWqTXhm0rQJn3veEbxmZHEuLMuYWe34bOeUeKpWBi
	xFIh4CZoFwUhPDjQGhqm9gxoRdxq2xKMrGMzksLWjU9SVxVggquzs8cocmjE3bhI
	4FAVUsIZEoU6MD5QMlRjMkzF5UgHsWJJBiOgbtURNaNSQKxPlCkRfu5JRoMXzO/i
	ME0VzaYGzfEwNdQkKO3ropG/elYyQj3vOrUNuqYZjbueobr6eXHOzIYIzqisMb0l
	KJNLjlLHhN9TIHrd/O5TujJz8/ymATdskrcA4LG8nDAD1Xeju9n+YPZhsgg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grrjdtewv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Sep 2026 09:29:57 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93be6ed214eso8068285a.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Sep 2026 02:29:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789723797; x=1790328597; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=csYgVbrv8TseQaIQhbFcx/zPAvB5tHhPbrMBPJ1Wxu4=;
        b=DHYGEA+nKui80Hj4TxLAB44cjx8Kz7raH1sZooCjIaDTFBSIPJy1QnEU6WGfOhgESD
         zdngCddIuzsB+4PdPQYrOhoPfWGuvpH5tnQsczC48d+bsh9c+n0JG+tWTxMwolMU+lh3
         QfxLO20s9f+ruG78oiR+he46JDZQh8FaosIlh52C2k4bImBOI/zobQaNUVefXXH06K8Q
         ZAuucbgY73rnbXMmixz+W1tBbmaUsrVRZ7+hg5/AocFeDwMy/F973EkaIIK9vANM94/l
         E/joSm2V/cPoQcjlRfoc4IAT0d6a8aXgTFi3knRPd/cjErpcdoIg3c6cIU/zVwuIAoaq
         6cKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789723797; x=1790328597;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=csYgVbrv8TseQaIQhbFcx/zPAvB5tHhPbrMBPJ1Wxu4=;
        b=pJJtmVv8AxDs2UX3yD7hAhfXxZZnZHVM0Xc4XFHqEpilAl3sKd90tIkSDIIyBwVdXO
         f97nao+ctUtnz+r8W/J9HxYM90MZgg83/G9sfVw++zaVDte7GbH0D/ScXXhWzhb3WPe5
         W6vFgJ1Uo7hcN8A9t3E8oiFRoAm2HXFimTY9qNMydlKFNjSDC99o/eV8jxaFmdyqla51
         hX3zGJW2o3W6+CMrvM39SoIsUmnVaMQikKYBdxtUwaq2umAJRQk2FJYuF8pOuzRg/zcI
         fdZ0fVkOGb1+LeYtM0m2lfR/LgavJqk3grzqbCUYIhBn1kWOaAUd8pbrUk8zm8ACStGh
         MlGw==
X-Forwarded-Encrypted: i=1; AKwUvBwFjiOu+Ob9SXbZW+6YXkTkN039HDDS//khod+ZyfjM1Y/kwgSaS9Z3oYH1mQZX5QtHLdyGZBqWQ6V8IrbwCdIq@lists.infradead.org
X-Gm-Message-State: AFuF++mei5O4tMGNj5JYlSGXloAUnto13DSEFZjiuknTV1E7PWXfA+hh
	/HoPIycXakCoSMEsNh3ZX/p46LqpApKxgCrND+vBw1NsOEPjcis4VYl0hLma7GRVnQ+S9XWiIU2
	ZIodNJZIF7ywvZ4yU2TMACj1NLBPfP2oiIUgxqaJaU6LPSmIASVg+8FmFsAzqR9Fdh8Pui9QAes
	csYw==
X-Gm-Gg: AYBFou1VCcOnS3dHFamoncO3yFH3FqXenBDaFq6+mgkKFokwOs/gI7NTm+V6iIGJtyX
	gOVYHu0yXD0uo4lJTkL9XPplbfZQF6nae7eWLRXoaCblNnoLoKGb8CL7ecFlcvldFUrLDQb+oXM
	IpA0tTyOD+tZQvH7ZstJu3OeebNu0tZ8TysO8Xx05YMXHu6ukcTn1HxPqekckvX/fPMz0pYZSzI
	96uk69t2et1w8C6RGrrlWQjzf9QlGglVhSIuQ4PnnWfaj1sWJdEV+rjgZO8Avd4segz6invh93c
	PNoetyQ5IRNHU2bY8d6YTTcIY1/X3YOShww4NyqX/nPTsaJDCY/qqX1Am+Yn+48OgKCdoxQRfNp
	TXo6HrrTcjY9XV5Jf0tAiF43km5KpWGxU/+QqqWrxdJP+5D3pq6KAnSQ03uWFXNeY482SYeclII
	v780dWsz6DEdA=
X-Received: by 2002:a05:620a:268d:b0:934:ab73:ac53 with SMTP id af79cd13be357-93bdc475a1fmr222769585a.0.1789723796735;
        Fri, 18 Sep 2026 02:29:56 -0700 (PDT)
X-Received: by 2002:a05:620a:268d:b0:934:ab73:ac53 with SMTP id af79cd13be357-93bdc475a1fmr222767585a.0.1789723796258;
        Fri, 18 Sep 2026 02:29:56 -0700 (PDT)
Received: from t14s (2001-1c00-0c32-7800-07d4-cca3-ec08-7ac7.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:7d4:cca3:ec08:7ac7])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a1bbc6bc0sm36796166b.60.2026.09.18.02.29.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 02:29:55 -0700 (PDT)
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Sudeep Holla <sudeep.holla@kernel.org>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Frank.Li@kernel.org, arm-scmi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        imx@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v7 2/2] firmware: arm_scmi: Always create devices for standard protocols
Date: Fri, 18 Sep 2026 11:29:51 +0200
Message-ID: <20260918092951.5656-3-johannes.goede@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260918092951.5656-1-johannes.goede@oss.qualcomm.com>
References: <20260918092951.5656-1-johannes.goede@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDEzMSBTYWx0ZWRfXx89buGG/FjOW
 1DcNS3kPbFjRUn9jVx0Q8ydcSxr5ZKtN0el249+C79vXi2ietEBLgfAK9fuOQT0KlZT6rLj5MNy
 rGX717YsE3KzrXni+tIiCdkxs047ujibehOzVvcXmljbXTQAGtYzC9XB5j3hsx9BngjvojISCtX
 cBRwkIcTnsCkLtHp0hn9dAw/gZKCRKzQZ6GKc0g2ZMESpaeyMczUHqP+LIlMG3PBfVhy+8T0nhQ
 6WNSrGC2B2OGHlcvDe/yw6ZwA0eE9sP80w3bJQF2xSkmDFgcpGMVCAsZfTjP/pqyUUfJ+jyWCnb
 xVkxLZmbCpK7vSCqYdxTxOvU+nqUBz0yVeRkU0cTQtCYtbtn/9nyNHMuI1awjY1KYY6Xgpck3Gc
 JUgSuxpo3SUBg0Hx3wTvfkbyt60IvJ5OEdl/WGAoh5blL9r3Q0FRqaAfs4G9ZBirVJuGdc7oB5c
 PxHMH5etXsDcPF5E49Q==
X-Proofpoint-ORIG-GUID: c5VrbWOeBBr64HTYpVY2DiX_uSNLZywy
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDEzMSBTYWx0ZWRfXxzehNwvI2ltg
 m+ZNB+yDQS02GSJZf+K3AmDztslLW9agJtpdDVVq2/xQD1719c71wbkR7FBS9kobX0KLjEhKCT7
 2rum/zwHa/W221wj36R8L8zFgbWKsfM=
X-Authority-Analysis: v=2.4 cv=J9Q/fwnS c=1 sm=1 tr=0 ts=6aad0495 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8 a=l971TreVHldC-rsvbM8A:9
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: c5VrbWOeBBr64HTYpVY2DiX_uSNLZywy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 clxscore=1015 suspectscore=0
 phishscore=0 priorityscore=1501 bulkscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180131
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_103002_428959_28C322E4 
X-CRM114-Status: GOOD (  26.41  )
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

Protocol driver module auto-loading requires the devices to already be
created for udev to get the necessary uevents based on which udev loads
modules. But SCMI devices are only created after their { protocol, name }
device-id has been added to the requested-devices list which is done from
scmi_driver_register().

This creates a circular dependency where device creation is waiting for
the driver to register and loading the module with the driver is waiting
for the device to be created.

Add a list of standard protocol device-ids and always create devices for
these without relying on these being added to the requested-devices list.

This removes the circular dependency, fixing module auto-loading.

Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
---
Changes in v7:
- Rebase on top of v7.3-rc3

Changes in v6:
- Replace the if (!phead) return NULL; early exit with return scmi_dev;
  Since a standard protocol device may have been created at this point
  (Shashiko).

Changes in v5:
- This is a new patch in v5 replacing "Pre-register protocol, name tupples
  for standard protocol". Pre-registering requires
  scmi_protocol_device_request() to allow duplicate device-ids, but then if
  the first driver of two with duplicate devce-ids gets unloaded device
  creation for the second driver will fail. Allowing duplicates causes all
  kinds of problems, so this new approach avoids this.
---
 drivers/firmware/arm_scmi/bus.c | 50 +++++++++++++++++++++++++++++++--
 1 file changed, 47 insertions(+), 3 deletions(-)

diff --git a/drivers/firmware/arm_scmi/bus.c b/drivers/firmware/arm_scmi/bus.c
index 51de50fbc382..31365d59b98a 100644
--- a/drivers/firmware/arm_scmi/bus.c
+++ b/drivers/firmware/arm_scmi/bus.c
@@ -533,6 +533,34 @@ _scmi_device_create(struct device_node *np, struct device *parent,
 	return sdev;
 }
 
+/* Standard protocols table */
+static const struct scmi_device_id scmi_std_id_table[] = {
+	{ SCMI_PROTOCOL_POWER, "genpd" },
+	{ SCMI_PROTOCOL_SYSTEM, "syspower" },
+	{ SCMI_PROTOCOL_PERF, "perf" },
+	{ SCMI_PROTOCOL_PERF, "cpufreq" },
+	{ SCMI_PROTOCOL_CLOCK, "clocks" },
+	{ SCMI_PROTOCOL_SENSOR, "hwmon" },
+	{ SCMI_PROTOCOL_SENSOR, "iiodev" },
+	{ SCMI_PROTOCOL_RESET, "reset" },
+	{ SCMI_PROTOCOL_VOLTAGE, "regulator" },
+	{ SCMI_PROTOCOL_POWERCAP, "powercap" },
+	{ SCMI_PROTOCOL_PINCTRL, "pinctrl" },
+	{ SCMI_PROTOCOL_PINCTRL, "pinctrl-imx" },
+	{ },
+};
+
+static bool scmi_device_id_in_std_id_table(const struct scmi_device_id *id)
+{
+	for (int i = 0; scmi_std_id_table[i].name[0]; i++) {
+		if (scmi_std_id_table[i].protocol_id == id->protocol_id &&
+		    !strcmp(scmi_std_id_table[i].name, id->name))
+			return true;
+	}
+
+	return false;
+}
+
 /**
  * scmi_device_create  - A method to create one or more SCMI devices
  *
@@ -562,22 +590,38 @@ struct scmi_device *scmi_device_create(struct device_node *np,
 {
 	struct list_head *phead;
 	struct scmi_requested_dev *rdev;
-	struct scmi_device *scmi_dev = NULL;
+	struct scmi_device *sdev, *scmi_dev = NULL;
 
 	if (name)
 		return _scmi_device_create(np, parent, protocol, name);
 
+	/*
+	 * Always create devices for standard protocols, even if the device-ids
+	 * have not been registered into scmi_requested_devices yet. This allows
+	 * auto-loading of SCMI protocol driver modules for standard protocols.
+	 */
+	for (int i = 0; scmi_std_id_table[i].name[0]; i++) {
+		if (scmi_std_id_table[i].protocol_id != protocol)
+			continue;
+
+		sdev = _scmi_device_create(np, parent, protocol, scmi_std_id_table[i].name);
+		if (sdev)
+			scmi_dev = sdev;
+	}
+
 	mutex_lock(&scmi_requested_devices_mtx);
 	phead = idr_find(&scmi_requested_devices, protocol);
 	/* Nothing to do. */
 	if (!phead) {
 		mutex_unlock(&scmi_requested_devices_mtx);
-		return NULL;
+		return scmi_dev;
 	}
 
 	/* Walk the list of requested devices for protocol and create them */
 	list_for_each_entry(rdev, phead, node) {
-		struct scmi_device *sdev;
+		/* Standard proto matches already have their dev created above */
+		if (scmi_device_id_in_std_id_table(rdev->id_table))
+			continue;
 
 		sdev = _scmi_device_create(np, parent,
 					   rdev->id_table->protocol_id,
-- 
2.55.0


