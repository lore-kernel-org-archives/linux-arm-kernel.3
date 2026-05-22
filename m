Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 977EECD5BB1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 12:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=l/EbcWlaCT4k9N1N4GMX/Z2U8nuDy2ujSl/x25p/kuc=; b=1JjpChtOONuZ7T2QnUfP90cZXE
	V+hcg5barC44BYPi/VNzw4A+L3vFF32cCI8PjQh852GGSq3c9RxIIXM5UaTGTRzTUparsOvQsUlKQ
	YLJraUwFptEJxiyu1c11qnLzEzDS10BoAWHeaBPPBd+cX3aXTbACr/lz544+6/zLubpldTVl0ONSj
	VmboYN9bcdq0z/MKCh+MFYQ353/XFLGwXvK6qW9VOHnLHQh0ohuPiiXAxl7OneHYasR20YBQaXoZP
	GhOFgYkQbZ0cejP6XEMqgZ+SzFeb3W798ll61PCPEtzWp2BsKbelvoSy3Ikt1RibHi0zY+kTLWoQr
	vfwsJ4Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQOfy-0000000AjWn-3z3l;
	Fri, 22 May 2026 12:08:26 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQOfs-0000000AjUe-49q5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 12:08:22 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64MA4B3p3947428
	for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 12:08:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=l/EbcWlaCT4k9N1N4GMX/Z
	2U8nuDy2ujSl/x25p/kuc=; b=Ns6eEsYzVQ4Ww85UapDiKBk7AkfjNUw1ky5KdB
	tm39HeL8e5JgioV571BIcubNsAJk9rF+AhbCOExQWdXHvhzExw1rHUa12adQGnli
	rwNbjXHH5yFBdYxcvBhzuVByFh5WuMyCA2A7wI9wMK1u90hPexSeZpNu1vmBg+4Q
	OFKc8TYUCpTV8IXqz9ZzM5xpFxv2Ja50Hsd4iI9iRYINZXlCMYDYbAetL8o/0dne
	6e1XUgZ+zfK0Koixcau5lu71yvi/lja1MFu/LSdGuvXaNWsWHD4OyJPCoiIMD6J6
	BmGa8zF+qgr5BnTAGnTpXiuFqlSKwvotspBKBYIfoyZ8X6qg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ean2ngd6p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 12:08:20 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-837c4eb3bdfso4442328b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 05:08:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779451700; x=1780056500; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=l/EbcWlaCT4k9N1N4GMX/Z2U8nuDy2ujSl/x25p/kuc=;
        b=XcG8rS32BUdM9ZAVEvFif5YqUzDs+zVbQuiyRzr/hUG6hn8iexVHm5CLCcwtbqSkcB
         pVJbLtkKZAe5AAs4Ez+It+7+jBTigOef4Rb59Kk62E+KZnRKxWtztx1HoESzhY0DPD6e
         zSf6shVbKWPvkD2hNohSs69HDTc9KBL/fWcmE88CcKzUbjepe74/0IKwLtoAUslGzw7k
         BgzdEgeK8+XZGzm9xB5gKZhP0Vixtnl3cdT/hSmaiWEZYXDCW9odkUzMle5AWwMt4V/E
         reKmz9KMRLAwfw5Cb6/lNnR3cml9srz6n6ol7sL/m3wvw/XTYjB9Ork1YRQvbrHiHzVR
         YOTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779451700; x=1780056500;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l/EbcWlaCT4k9N1N4GMX/Z2U8nuDy2ujSl/x25p/kuc=;
        b=aboCmeO6D5FwjoESG/O6XVT/9wqCsEcprOPE2w2FAd+YUb65Gb1j8tRgQRUftwz0hL
         WMMt3SCENPm9+5CIko1hKquc+mvnNURdFYIr2pd3W2N8DSgKN9bM5GHDHdn5PEiCTFMe
         MRhLj+k1ZmG3w1oh0chF1QUxKw37NQ87S4bYlR2DB1I3VpEW1cNrlMdLrB7Ta0qIxBNq
         Kl+lJqZ0hUo6qGxBVNMQ5v+NyOVcw04g8HPPvPvhaLj5jzs6gm3LEU8lj5Xop9+ObEUX
         SnvKNH5PVhS/ffMnnFp3ZAvh6ru5A6/bxxV2ixHxwcRiB/sSS4u3YvZTPEWvoVEPjEUe
         I+FQ==
X-Gm-Message-State: AOJu0YwQF81onGGB4vEr2ngDR4vGEN6Ic0x6mhgDtWomkI3pR39cbV6w
	Y3240A2WGCDTf27naZCMLWCuJAJ6UVAqjguXfBqWndsIQXpBvNWnIkdaNHBXVY+NdMhkohvnUtN
	wje8sasLdg03GvwdCUZ151QPzGEfiDHe/kwdhfR3bq2SwDHvJZOfP+YIN7Juzly/V5exTDZkHar
	Ua8w==
X-Gm-Gg: Acq92OE6SAR/5VWVYv7ZBRlIOGy3+xo72zh5dUf3OBvbfmDf7E1rBA++e/LAJgIwO5K
	VfePDJjetVvKkljxeyN6YLk61A3sMXE5NJq98NJVBxy9CxskQpj/Pu4s05s8uUDIz4zjkSKut70
	Lf3v+nja4lWLXRElfjX93YAJEPyR95orihJaF2B8M1fTkgRPxVVvN+6iFAOPT9mqGUcO7D9altt
	x4ilq9XLJ1Gp2QvXWMk4Zk56FKXKkzUAKSlqLps91ZcR8sD+CXdqFRgIPG7fGSWfaS8U6sINCZo
	SYZNdjxZtzw0mj+izw9b+qf8LLo2ni0Mrvek3W3qEHJbZwC4bStZJ6u4UdBepxjXUmhJrdn8kxb
	B2gEODkNkh2Sd53SiB0Z9fMwjBhr1pk3l3/Nm/vg0YpPRtfd+xmgsIBfhoW3wn+IEo3Y5hjcxP9
	1ZXPFY59Y25hoADg==
X-Received: by 2002:a05:6a00:8c04:b0:835:cc47:6fe3 with SMTP id d2e1a72fcca58-8415f3b0825mr3980568b3a.45.1779451699714;
        Fri, 22 May 2026 05:08:19 -0700 (PDT)
X-Received: by 2002:a05:6a00:8c04:b0:835:cc47:6fe3 with SMTP id d2e1a72fcca58-8415f3b0825mr3980523b3a.45.1779451699170;
        Fri, 22 May 2026 05:08:19 -0700 (PDT)
Received: from jinlmao-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164ffee25sm1812820b3a.58.2026.05.22.05.08.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 05:08:18 -0700 (PDT)
From: Yingchao Deng <yingchao.deng@oss.qualcomm.com>
Date: Fri, 22 May 2026 20:08:06 +0800
Subject: [PATCH] stm: p_sys-t: Fix su_mutex held across wrong region in
 interval stores
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260522-stm-v1-1-cbdbab9f9ee7@qti.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIACVHEGoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDUyND3eKSXN2kFFNL8xRzk9RUsxQloMqCotS0zAqwKdGxtbUAo6b7W1U
 AAAA=
To: Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        quic_yingdeng@quicinc.com, jie.gan@oss.qualcomm.com,
        jinlong.mao@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        Yingchao Deng <yingchao.deng@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779451696; l=2360;
 i=yingdeng@qti.qualcomm.com; s=20260521; h=from:subject:message-id;
 bh=/sVcLq/SnB7dgVSyU5tIaVlIonGAraV4aUcqKdWR0Sw=;
 b=iq04wTDJ+dwmeDvU5JNknfPq72An2aZOs3OXggQ9Mr6YMyqOSbKSWtqbAHtKFIPDscitKO2s8
 KlEPFIxmw8oBDj3yBZx6SrxqAouGX4Njs5Zaz4PvxlM/67ADCSShj7a
X-Developer-Key: i=yingdeng@qti.qualcomm.com; a=ed25519;
 pk=YbHeeX0Qzqo7voZLva784lFhVChB9yF3a4sceW95ljA=
X-Authority-Analysis: v=2.4 cv=XvDK/1F9 c=1 sm=1 tr=0 ts=6a104734 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=3pKDUSyV39LOQavuatcA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: Mdk82c0imKuImkedVFEtp9BiDCXtpzOp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDEyMSBTYWx0ZWRfX+z315Kf/WFI6
 2rn51DzKzdh5mwe9NWeYmug61OUQ6nplPWOTgWKCeOdHf0uUBqhMH1UlA05gU/3/R5Z8Wcf6yVW
 ZtGcG3yLYjcs3LEBeeRxUFhq7OmQhlsVnA0cC/CgWwHjjQiR6hUGyOB5cEKVQpEKuVDWr7utQiQ
 2SoFqmoOxiVNIeT8B22DUmN/ieCVJTU+T+IcpGkm8eZ8bYSj2dA3IuQfV8ph/uH0ORhPLMIxjdt
 nZJA/SIsTanloJtvOz3Jnk8uY6PgP/phP3K5RGBFRohgA/Q1dfOfR1Y1S/zWMLIiPXCSk7kM+Nj
 uht/A/sgTC6u2fSuUu62pLi3EDzi0PTStEB2ntFQg2hgLaAu8zNrg2o7NjC9ymkN5bRXXlKJuqJ
 C5/30JTeQ1h4zTzcTp453VEAl/47YUy9eImKnPh88taTHRi7SufCqlco6XC5BLRhiH2fPPNYDNz
 HREpUFHc/JNojYTQrcw==
X-Proofpoint-ORIG-GUID: Mdk82c0imKuImkedVFEtp9BiDCXtpzOp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 phishscore=0 spamscore=0
 impostorscore=0 adultscore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220121
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_050821_037766_59D9D957 
X-CRM114-Status: GOOD (  14.40  )
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

subsys->su_mutex is used here to serialize attribute stores against
pdrv->output_open(), which copies the policy node under that mutex:

  stp_policy_node_lookup()     /* acquires su_mutex, returns holding it */
    stm_output_assign()
      pdrv->output_open()      /* memcpy(&op->node, pn, ...) */
  stp_policy_node_put()        /* releases su_mutex */

The comment in stm_assign_first_policy() (core.c) makes the intent
explicit: "This allows the pdrv->output_open() in stm_output_assign()
to serialize against the attribute accessors."

sys_t_policy_ts_interval_store() and
sys_t_policy_clocksync_interval_store() however acquired su_mutex
only around the kstrtouint() parse step, a pure local-variable
operation with no shared state. The actual writes to pn->ts_interval
and pn->clocksync_interval were left outside the critical section,
defeating the serialization entirely.

Move the mutex_lock/unlock to bracket the pn field assignment instead.

Fixes: d69d5e83110f ("stm class: Add MIPI SyS-T protocol support")
Fixes: 39f10239df75 ("stm class: p_sys-t: Add support for CLOCKSYNC packets")
Signed-off-by: Yingchao Deng <yingchao.deng@oss.qualcomm.com>
---
 drivers/hwtracing/stm/p_sys-t.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/hwtracing/stm/p_sys-t.c b/drivers/hwtracing/stm/p_sys-t.c
index bcbbc4d92325..077b62ca3f46 100644
--- a/drivers/hwtracing/stm/p_sys-t.c
+++ b/drivers/hwtracing/stm/p_sys-t.c
@@ -210,12 +210,11 @@ sys_t_policy_ts_interval_store(struct config_item *item, const char *page,
 	unsigned int ms;
 	int ret;
 
-	mutex_lock(mutexp);
 	ret = kstrtouint(page, 10, &ms);
-	mutex_unlock(mutexp);
-
 	if (!ret) {
+		mutex_lock(mutexp);
 		pn->ts_interval = msecs_to_jiffies(ms);
+		mutex_unlock(mutexp);
 		return count;
 	}
 
@@ -241,12 +240,12 @@ sys_t_policy_clocksync_interval_store(struct config_item *item,
 	unsigned int ms;
 	int ret;
 
-	mutex_lock(mutexp);
 	ret = kstrtouint(page, 10, &ms);
-	mutex_unlock(mutexp);
 
 	if (!ret) {
+		mutex_lock(mutexp);
 		pn->clocksync_interval = msecs_to_jiffies(ms);
+		mutex_unlock(mutexp);
 		return count;
 	}
 

---
base-commit: 80dd246accce631c328ea43294e53b2b2dd2aa32
change-id: 20260521-stm-bd597d74ee6d

Best regards,
-- 
Yingchao Deng <yingdeng@qti.qualcomm.com>


