Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0900CFD8763
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 13:33:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tXmfvTYJB8OfseCvx8dXYrfeCi5XnyrDEhI3+3eVAeI=; b=RabFcWSh55EPM/rzwqezzmTzhz
	xSF8DdUtWlpYneHgUcBmyaxgfkAbmr3NsdV406HdAzQqsF83gMUv1aIHTjwDKJJ4Y3sk3Lpdd5rkX
	wrIARe5+Fa0ZIL1rAVia5gJLQLglwLIDatLsGtkvPgHrK6OK4YAk+7FrPvbG0UwmM5/BdgNKJN4Vo
	MwRsRUHuNEfq7WmZressCvC8JIDsEBcYcYHazEEhCR0kAPLouovK7PPoewZPAQrmQGgisAQhbrN9T
	URV2ABuNTqJ/N4bGa/Nfx2GW/TMbAlSfrgiUNFZTGuFy/vNM9euYbBtEIkq1dfrVOKVQsLLhJ2yz3
	mWq3zdMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2UYR-00000006R90-01fR;
	Tue, 17 Mar 2026 13:33:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2UYJ-00000006R3P-3kSu
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 17 Mar 2026 13:33:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=tXmfvTYJB8OfseCvx8dXYrfeCi5XnyrDEhI3+3eVAeI=; b=RJcfD72Fp/f3BIQg3cTMgFwgiw
	4Bs8FllWw9+me7O6hGshDpBXKRyJHFFjsRiSPKNevemHzMYLwSuXE5pMKeB6EfDbFDTu40SgrBFa5
	7PhVOZnLKTvXKgMvWRqhwnRBicunJ4IeRhucFGd3IZBuUw0Fm2ZRpA7jjcJV8MpZhpsPHjcr6bwS7
	WZLTjAvkaRzn9YKu6bNIeGQZB323r1Z4Hnpv6BLyzOAznhbeY9ftramW3xJMfn+eycrkR8jFOVXTR
	wx2lqzWfyqkpnrTQ92/tvq0DVlhOZ/rg6TRrGrtQAneuXA8+dglcVJNV/o+MWU0BQUSrb1X+bsI9z
	M5jgDNGQ==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2UYF-000000095wR-2eYf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 13:33:41 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62HD01QU1639402
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Mar 2026 13:33:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=tXmfvTYJB8O
	fseCvx8dXYrfeCi5XnyrDEhI3+3eVAeI=; b=cMxosxFZ8lMtSuzLZd9dc1eK8NO
	RPXekCCxrh6w3zA16OeDJNRZx1hvdrq85XrvtodSEJD6cgAB+Cm169juIzbKNSQL
	8GabAcQqBSUq7BFQm4M8lWn85PuWFM/fyldaBF9SeJl7XmW70XkcjX4sGGjllwIs
	VxUxnFjd8p/5vCxY7MNtkJ0pJpVFrqj7cGrGnd7AAD5w+O/FsWezKXKmpxuV4/Gh
	4kDO+Nf/0zo9PPKaSuR4fzNonmSqaZmVBUR8DsNbdpyMg5k5DcnT0fZ/yO4tZCNd
	1iahqJxVKqH2p/wdDcDO/wB5qk/pmD8XqkfXAVHtR9LzzccGZxE5it41GDg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxke0ce09-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Mar 2026 13:33:37 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50917996cfaso22110121cf.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Mar 2026 06:33:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773754417; x=1774359217; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tXmfvTYJB8OfseCvx8dXYrfeCi5XnyrDEhI3+3eVAeI=;
        b=bQUu6CspDO8jGBp3zH+TXEKu3tBwG0b7+giQ3FoTUTHntn3YJOEeO2asBJJKVmSqph
         pAXx8Btqf/IDd2nLlkDwPbHCiCcT64bSvoU29yB5KF+D61j1UUqJXctWL/l6JmA+RxA5
         eNgWOo/w/1hTRuaYXlzTHnzqmyn4KrwQuVxCUy1RQX0OdGTZshdqqPwNoTs9qSmBk+Hh
         6ZgAjdtttkGX14qLjikxvxzE09ipN1MeD/clRBZYJKLHDm4fQ12nnJ1FbMwnPmb8gcOF
         v5KkxqSZ+mV6EluqQjfOl5M5gqsgFpllyOOchWfvtecWxmQUFcORKDDPPLlmK6uHKXs2
         vFNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773754417; x=1774359217;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tXmfvTYJB8OfseCvx8dXYrfeCi5XnyrDEhI3+3eVAeI=;
        b=lJRmiGJtabW8MnS3+W92aiBZcaJjVi6J4ohzfx79JFS5EITc1orH/FzcyeoQBEkpEp
         OvTEFCYM95V6afn+aLvwh3j9lcBh3IImhcWHFv9uprL8YWV7xtYpAaAEvJ8J0QVNdIVI
         1+pgJqqRqk/E3NrRqc+mjzLRRSjxFf7aSzhkhZ6VTIspMX4nWi8mQZVX7G/GHLD0lI9p
         3Ni7qIdJFtP0Cf3mGUtSscsPqH51tEm/fyYir+my/A6AhAOBMKfkMZLjmq5t9JsYU5lE
         we5RCAPo0ttrXkSX4yaeGo9BvkMTK7Y/wpdMlYn3OqnAKl+wLOOXPq955gR84QlL5MNE
         3duA==
X-Forwarded-Encrypted: i=1; AJvYcCUJy6qQk3HeLq5yNelzz8+XWTEDa57J4sRfgn0ksvPn2EVj/Jr0orMnBJMRXz74RjXA5YK19L8htTOgEiok6SJj@lists.infradead.org
X-Gm-Message-State: AOJu0YwVBJdC9ygVG9aZSa8QDCEqP1AmcSjjeZ3s0hxvcfbBS10IehCz
	JvzXQD4YTob2S9+I1AKJ9XqH6vbNowYUIJuKLJZtu0lKY5k+W0VenUvOkTM/bNjwGEOWLJXxt/D
	uOQyeD0QWsHlalwFN0fqg6Y3mCaBSPXZCYTptVAqWS2HEQv0Xn4mgHXjuvw5j+GDwRxE6SoMLTu
	Kqcw==
X-Gm-Gg: ATEYQzwicAnueH+vXjDjEoXtN0C3adK2VF/2hjpxfZlf/C29WEQSefOiVU+XgvaY5PP
	kMYazLwr/zfSR8bW5BHYOVRz5xMYJYjfom0EdgVNSlLWpqXlG1j5nKEapvHt8Fd/xyx9dLJny2u
	3izWumrh8PEim2m+2hoLyjoBe7PxNZtknBXXZTlnnoJjCjMRRotZ3btGB+CBucyL6Uv+1ehJQvU
	/HvTu33cD6GtnOjMLxU/K66F03kGgvZ7nTB6Gs9bji9N+hOxPY/uFjILyzY4/VjtCK3ihtFWBWE
	drwYROVI5wBNBCFr3+ybr2kc6sXWo87lOjWLXZuakjnq5Tmvfj7F+xeVwI2oO6Q4uxEDqtq/m+7
	lCh94IA+Tpg7cISQUh15F+CrR8dAmjUeHRLpn
X-Received: by 2002:a05:622a:22a6:b0:509:5987:f4ff with SMTP id d75a77b69052e-5095987fccbmr240504801cf.61.1773754416962;
        Tue, 17 Mar 2026 06:33:36 -0700 (PDT)
X-Received: by 2002:a05:622a:22a6:b0:509:5987:f4ff with SMTP id d75a77b69052e-5095987fccbmr240504151cf.61.1773754416323;
        Tue, 17 Mar 2026 06:33:36 -0700 (PDT)
Received: from quoll ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe19aec5sm51358613f8f.4.2026.03.17.06.33.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 06:33:35 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        Tyrel Datwyler <tyreld@linux.ibm.com>, linux-pci@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Jonathan Cameron <jonathan.cameron@huawei.com>
Subject: [PATCH v2 4/4] PCI: rpaphp: Simplify with scoped for each OF child loop
Date: Tue, 17 Mar 2026 14:33:26 +0100
Message-ID: <20260317133322.266102-8-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260317133322.266102-5-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260317133322.266102-5-krzysztof.kozlowski@oss.qualcomm.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1220; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=9DhCCDFm896xvW9DJLZa0Xniri5OwyXWSIHDphJEFYs=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpuVgl+jPVUMZ1Xl2C8Qlcx/qCoESwPPQQ93fLy
 DPdpQXgiXuJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCablYJQAKCRDBN2bmhouD
 18g/D/9yRaLcZiBvBPgCkpLNKJ5s3HApSEcdu8UX2CGfgGYAHuQpfm74UP1W+AY0IsIPbBm7jU7
 oC7Mt+tXTWlC9RYfv2MsR+wYkbEaYY6V0gdZtIObXmLsqYmMJvLkQkZdHCktv99zxBPp7QhsTx4
 XObU/2EkTdzr3wFJUahjdM8a2feprqGSrY6EK/+TD5pbXeOsl/1Hp8ULTWveF7H15rGznW8Ck5G
 d0FizsAFr5hbgfk7EPLq+fHBsA+UKqJ13lyXoTz1tTgGSMqZ24/47l7RrYTQucxFkMlQEiIHJHb
 GbZD4PmufA/zUmSVCXw9DgujtZz4XmWCgXftbAN2BDAOLJofujvKp4PsKtPmaiEYayUy2e5UHYr
 Wrc9YQRjW6N98OJvyHLLuOii6NX6CO85UVtZKtqNV4uehkYKxznGkvJ6bjGmPuTEnKqJr/iLx+w
 YtI4A5/mJs7rWMYKxtrH7CDDrRIYKs9IAQOpyMGrT2BCsPQHVyFClrhOAxfSOfkdsj4Gp6krEuk
 M9pAY09ONTTpqte8ntrwAUMgJ5CLjJNn9IjnYSftwB6yHb+TunyWIy/T1JmMgxwelgJmy2MwbZc
 M0fzOQScJG7f5MTk3p++jmm4ts3+qBP4MxhhTjDrfOu2moH78UvcuXv1i6MwCZvdYA6kjVZAqlJ ThqBrzVmPBpQhag==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: h33e6c4NBELSohDzXaF3gRnEIfopvexF
X-Authority-Analysis: v=2.4 cv=aue/yCZV c=1 sm=1 tr=0 ts=69b95831 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=i0EeH86SAAAA:8
 a=EUspDBNiAAAA:8 a=d5zWgTKZ4CwGW_Y1MEAA:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDExOSBTYWx0ZWRfX2Jh9d2IF+ub1
 SzNfftUgJnFyqITcj+6Y+0ADhr2NKxhnxhykurkQJT4C6+DDM+6EswDVqUM3ndFJklPctsb4DJ2
 xPgyjO5gnVvCXA3koqyC07DbiCRea3cJW2Adl/g7HdI47D1V/pC/xo/Ag0+2WfeRq1GdfuPnmYV
 Cudd9oVui2V7DL/y0qmOQnmlNu/78o7ddYLwA2vOBaikElUuxwfiRgNDFybFFyVBcUK8nFdnCIM
 MVnYVFDW+nHXYi5CtyVZv8DK0bgFxWuZ/w3EajXYeO/7vWvY+/sXNCaGMMwpjGePsy7TE2oEAPF
 YD64QbK6bGuKilc+8CReUqyhB9fk3v1QpZkFbWBYGOODu8iqaEkWKSkMEcNpfpSdYl71I3GI5y9
 pBEoqxmqJIHvCnnIFis9Y0k9B1HMatSbLtnvBU0DZq7rRMGewd+NNzd2vUfaYsHHqO972LxvU3Z
 /u3BjC295vZSLLzoHjA==
X-Proofpoint-GUID: h33e6c4NBELSohDzXaF3gRnEIfopvexF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_01,2026-03-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 malwarescore=0 bulkscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603170119
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_133340_094846_C7EF00B4 
X-CRM114-Status: GOOD (  13.94  )
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

Use scoped for-each loop when iterating over device nodes to make code a
bit simpler.

Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Changes in v2:
Tags
---
 drivers/pci/hotplug/rpaphp_slot.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/pci/hotplug/rpaphp_slot.c b/drivers/pci/hotplug/rpaphp_slot.c
index 33ca19200c1b..67362e5b9971 100644
--- a/drivers/pci/hotplug/rpaphp_slot.c
+++ b/drivers/pci/hotplug/rpaphp_slot.c
@@ -82,7 +82,6 @@ EXPORT_SYMBOL_GPL(rpaphp_deregister_slot);
 int rpaphp_register_slot(struct slot *slot)
 {
 	struct hotplug_slot *php_slot = &slot->hotplug_slot;
-	struct device_node *child;
 	u32 my_index;
 	int retval;
 	int slotno = -1;
@@ -97,11 +96,10 @@ int rpaphp_register_slot(struct slot *slot)
 		return -EAGAIN;
 	}
 
-	for_each_child_of_node(slot->dn, child) {
+	for_each_child_of_node_scoped(slot->dn, child) {
 		retval = of_property_read_u32(child, "ibm,my-drc-index", &my_index);
 		if (my_index == slot->index) {
 			slotno = PCI_SLOT(PCI_DN(child)->devfn);
-			of_node_put(child);
 			break;
 		}
 	}
-- 
2.51.0


