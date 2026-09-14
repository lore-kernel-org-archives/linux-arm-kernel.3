Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A539C88E64
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 09:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mtciI2dXuSRKP7znBi6/ImEi5cWqof1ckcMtFCHtuf8=; b=ydvk/oS21E/KuS9H8ksdRVsQH0
	TrDNX5iW+NkSlIpJqwrsr8tFDqGRGyslA+MhibPNlGpO0+zrJFI0uQb6sE+LLnA4wwAKxKXVN0GeP
	Q6Fu4jDph5U0ngtCK8jqhXe6bbcfMQJAc2PpM6OcwRig45IqGXY0YBVF+crT5uRQJz4c6Tbk5jGKu
	eMP71HQabP8H/VkvQa/Eq1iIw4wJhA6C1rYXmgneELxr3AMcs/lqHXI/uLa6TJm/ShEFYA3i5tV9n
	qzGcIrR8AG10BkaRizAnMEmbMEQz+22xjAFX39sUKM1n8nLusLOwBbXtk2/Gohq8ctNUW+tcMGKck
	/QIMllgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x63AS-00000002zFQ-0bYL;
	Mon, 14 Sep 2026 09:40:04 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x63AK-00000002zCX-0oM9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 09:39:57 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5jIan3740650
	for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 09:39:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mtciI2dXuSRKP7znBi6/ImEi5cWqof1ckcMtFCHtuf8=; b=GvCGd3b7ibiXNVov
	KGk6RyollppYoLgluhcTje2RH00hvnrzULm+sVBo/9CjHL+KQjbNG7+UrSm5TsFp
	oDOW2/+AxLOFkLsnFyyZ/iUZ0JqyZhsQGdTqE5dhQKAAaXUdLcRN2U44iHuYtkMS
	8AcygZtX6xVz68/d6aGC4UKivxT5syVmOcfHu2sxh6tXutAQJAbnT3AdODhGYo/x
	Ks+kk+z+IODcVD+rVfd/4+SvzgKpaqYXWSJ3ufqqb+H1N7I/+8ge+GUzwpCm+Pat
	2OkaPc/Ms3op9Fbt/JqvBejUjxVCYi3ccjEFJGgV58PdtfQs9kMiaILbHNEYL05q
	gqrHPg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9ddyt3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 09:39:54 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-39dc5d85a9cso1885248a91.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 02:39:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789378794; x=1789983594; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mtciI2dXuSRKP7znBi6/ImEi5cWqof1ckcMtFCHtuf8=;
        b=CgZrCQJWfSC2gH/p/SJYFwZK3GSG0g7R7izDEBwhFvrG8sth9OoRXxWQWAMNheYpkj
         wvUH+ZPk1Jt8DUTfjXEDBzJlVBbY4dMhhtQIFhWd4sevpVxUywPQvpxp66FXWpaq6Bhc
         4tz+IXVuLbaWe7O67qdvalFFNgYSMaGsYWcQp2+twudNZtsccxtH49jYKnAScZZdbgPO
         SZoc9hBGh3OQ1IpgjtqlH3x1eQ82wRvbPnRmaCvawYt65NWWyCZdxPhAHl3Bh1FUKOx0
         4bDAWep1U8MVwfn9/ze9+J6+l66WmlHrS58EXnzIvknGgQY8GfPN3wp6nD3z/+uidaUm
         uVbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789378794; x=1789983594;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mtciI2dXuSRKP7znBi6/ImEi5cWqof1ckcMtFCHtuf8=;
        b=amGcLILantbC1OoSgavgGPfrM6R2NSOdqZ9ioTwMx6BkAAUWB8rMlyL7Ai4oAELL78
         DpUSpWKlYJLXywh0lf7r/KdQZIMr4ml19Gd3is0Z8rOPJtmxEL5ssmnOIoB+IG3vRi3e
         enfjcIXlsuUS9MvwT78WsC/EZSe+5Ww4TluKRtJG7fc8reCU1rrG0h5/ubdOgC7C+4JY
         g+bXfMcQfk6Ir0w8AwnvrOhO8vVbG7ZQRmkADKlOkg3NyJc5ih8emIOLDuWyGlP8FURv
         lRIo1mfioZfp8pb4hegw8koSLauD5NPHL8Z3Q7GhHRM7db/Nz/1dRrxKZXGt7jQNvzbR
         GM4w==
X-Forwarded-Encrypted: i=1; AKwUvBxGkWz3fKw7PSTOdP+UhIZyliPr6H2ES0b/umSZNaK2AzbLt1fo0RlaogNg+4Qs3AHU+qcjKyzosmHeHE/j5CG9@lists.infradead.org
X-Gm-Message-State: AFuF++lVz29Cnfb0AK/dhJUF4BYBlHypTHNaIYKr74OiCcPItc+BMjwU
	NNxuBByyvDGwhSROuC/A7hLV0tH/56Be6K1JgG0n0ilonfAa3x9Wn52hHclSonFqTMOn/4K+hjv
	/Nfgt1g4Jq6PaxU6/bzAkBxXP2+FdI/56IMmCUs7YSToy9bcoAa2aC31LVGBxrO21KkgOnRXAyV
	TThw==
X-Gm-Gg: AYBFou3b5+TG3UqUB0Yni0YnB5R8WJ2N8NBZTUOWWdP52loAYB4rAPw6ikH+OPizCRr
	jbmchpAPGdw2EGXHlunep4+j2pZOPjMYIryw+5BqnFEhyRRRAYfJA7M/Ll6UnCbR54AF/KQSRMD
	jo8V5N51CPXxV6LfFwVGkRMN6KrmcAwde4UPhDawGS0PWEOuMUiyUvMXfq1tjKPN+vWKMiCSJkl
	QTaHaf84G2EUMLXZD0xzZwe2bWhKx9e0gNt78he18++1yPG1nLMofpSuK6x5G7HzVfzLTIFLO0G
	dORvfvnvtcToQI0fDgxah3f6ShRiwHyeeIzXOZHxdb9BcLjmgLFfqtNb2aPLBxy2nkl4DcY4Gn/
	sUmlCjjpShWR+vWXyLd2hrm5cpun9ia+835MfQcOD8Qq7sZh6fihun+ix
X-Received: by 2002:a17:90b:1805:b0:39b:4877:ae90 with SMTP id 98e67ed59e1d1-39dec143751mr3901791a91.22.1789378793857;
        Mon, 14 Sep 2026 02:39:53 -0700 (PDT)
X-Received: by 2002:a17:90b:1805:b0:39b:4877:ae90 with SMTP id 98e67ed59e1d1-39dec143751mr3901732a91.22.1789378793357;
        Mon, 14 Sep 2026 02:39:53 -0700 (PDT)
Received: from yli42-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d98e60484sm19488728a91.4.2026.09.14.02.39.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 02:39:53 -0700 (PDT)
From: Yin Li <yin.li@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 17:37:50 +0800
Subject: [PATCH RFC v2 02/10] arm_mpam: Fix MSC MMIO window size off-by-one
 with resource_size()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-mpam-resctrl-dt-knp-support-v2-2-bf6645bb2f65@oss.qualcomm.com>
References: <20260914-mpam-resctrl-dt-knp-support-v2-0-bf6645bb2f65@oss.qualcomm.com>
In-Reply-To: <20260914-mpam-resctrl-dt-knp-support-v2-0-bf6645bb2f65@oss.qualcomm.com>
To: James Morse <james.morse@arm.com>, Rob Herring <robh@kernel.org>,
        Shanker Donthineni <sdonthineni@nvidia.com>,
        Ben Horgan <ben.horgan@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Reinette Chatre <reinette.chatre@intel.com>,
        Fenghua Yu <fenghuay@nvidia.com>, Jonathan Cameron <jic23@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Gavin Shan <gshan@redhat.com>
Cc: Yin Li <yin.li@oss.qualcomm.com>, Andre Przywara <andre.przywara@arm.com>,
        Drew Fustini <fustini@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>,
        trilok.soni@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
        ganapatrao.kulkarni@oss.qualcomm.com,
        Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>,
        Huang Yiwei <huang.yiwei@oss.qualcomm.com>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
        devicetree@vger.kernel.org, kernel test robot <lkp@intel.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789378759; l=1748;
 i=yin.li@oss.qualcomm.com; s=20260811; h=from:subject:message-id;
 bh=1/dwipsmDrfzLit921IQVdk2VPlf3+aUAoUuV6A273g=;
 b=580EJYrRRaQFaJTBhTGLIBPMftpDItwYKFFvVgVOBnIGXre3jEMO3P5n/lbQty+QF8/WDbE3x
 ujX3TeCQLrkC8JlprOX1id1zXH56ewGS0cLUd3xaxTFVmX6xlGuwBU3
X-Developer-Key: i=yin.li@oss.qualcomm.com; a=ed25519;
 pk=e/2LM97aSWGBMrxY240URBi9Zi8/kL5hXgB+VHkYvW0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDEzNyBTYWx0ZWRfXwJFOzQ3hdUtX
 z3n7wlnYbHK+EcVy8jpWM1WHEK8hqUxaXZ8UExeBNj1UaDFkPPyA5oUUKPMDnH4OnmRMI2fwlYk
 hl3hnN/zcN16OFZlLX+THlgobI9YXi71zsf3ClzdX785W6OLs2AfBZnTbmHVptLLcVFQnL4qL3j
 xixknkeZpj8oHArZRajAoyA2HAeyAKdKsPwxfg+7NUH67XUvjPw6k//LFdPbYEue+l2ISvrO36q
 wRMQYe2vWfnVszzpdSQ6QUb3abDqwVqJXKXJ84yjW6Cs/8ZGEuQgGyqDQM+Td4/zdsJEwBI2GBd
 RxadW5gso5X1REPNaeg1YaYcKj7KqwbWe5CqHddIzVst9np7Q08J/nhpkXUAF1A064o2uZCJLUt
 x1Cny0eftLgFVC6FQZczm3nNiI/dlG1VL3HQSEo4PXJzacw/FfplYqy4Bh/LgtNqvh9gbhBkWUc
 ++BtxxIY1AsIVwAhjfA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDEzNyBTYWx0ZWRfX4MuO3i0oXpAf
 XDgeqyXykz1UmiACeUFkPFHDW9AD9JhN+/87zoSA0U1ssfvTImyoElZGCtyMkpnPCO0GQMq/J6d
 h1CRMdOQ8KOMk58U3ToMO5gJ/xAGVsc=
X-Proofpoint-GUID: jRP8GWHJVimx8Sb-G1zxQNNxjq7-UGZo
X-Authority-Analysis: v=2.4 cv=OeUNnRTY c=1 sm=1 tr=0 ts=6aa7c0eb cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=7CQSdrXTAAAA:8
 a=s3E7sL18FQBPR4dFS-QA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: jRP8GWHJVimx8Sb-G1zxQNNxjq7-UGZo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 bulkscore=0 spamscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140137
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_023956_354198_E1348ADD 
X-CRM114-Status: GOOD (  19.51  )
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

struct resource uses an inclusive end address, so the window size is
end - start + 1. do_mpam_msc_drv_probe() computed it as end - start,
which is one byte too small.

mapped_hwpage_sz is used by the register access bounds checks, which
have the form "offset + width > mapped_hwpage_sz". With the size one
byte too small, an access to the last register in the window is
incorrectly flagged as out of bounds: for a 0x1000 window, a 4-byte
access at offset 0xFFC (bytes 0xFFC..0xFFF, legal) computes
0xFFC + 4 = 0x1000 > 0xFFF and falsely warns.

Use resource_size() so the size is correct. The ">" bounds checks are
correct as-is once the size is accurate and are left unchanged.

Fixes: f04046f2577a ("arm_mpam: Add probe/remove for mpam msc driver and kbuild boiler plate")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202609030809.ObirDhR3-lkp@intel.com/
Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
Reviewed-by: Andre Przywara <andre.przywara@arm.com>
Reviewed-by: Ben Horgan <ben.horgan@arm.com>
---
 drivers/resctrl/mpam_devices.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index 6da217abf689..c68135ee0ffc 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -2095,7 +2095,7 @@ static struct mpam_msc *do_mpam_msc_drv_probe(struct platform_device *pdev)
 			dev_err_once(dev, "Failed to map MSC base address\n");
 			return ERR_CAST(io);
 		}
-		msc->mapped_hwpage_sz = msc_res->end - msc_res->start;
+		msc->mapped_hwpage_sz = resource_size(msc_res);
 		msc->mapped_hwpage = io;
 	} else {
 		return ERR_PTR(-EINVAL);

-- 
2.34.1


