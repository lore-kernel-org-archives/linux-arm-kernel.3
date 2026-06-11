Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E581ECD8C9D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 20:19:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xsHObREKbSdD+QU63I499ixe+MAp/Ig/XpnZqBETjO0=; b=Ot2GFCXNWUYHUYQcQqcnNwHeHn
	11vhZQxDVR9Vc8aPRzajoVkZTprapUv3j/Gz4sMaqbAiWDUkmSzYWkzDPSVJU1DArrM93q6mFFBRr
	nPQAjcf6LX0V8dxw2aMxk131BGvPQVvXy4kbBnG44wcKZ34/x3/6RpG6iaasjZmXxQg7kctF46a0t
	pal3RIOsBRGdGRfmNwelFrXzMuYPRRnVaBArxxX3VId6YDUTe4wjvv4j9HfN9N671xxs12GV6Pg29
	VXxWaVe5YcnsQnpVPyuMMZp3ocHajDvM5tekRCUVm833XPyGlHSpiWpoOLZuHnIO4XFBlbdRNjgR8
	jBiT64lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXlsD-0000000A2Mz-2UDh;
	Thu, 11 Jun 2026 20:19:33 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXlsB-0000000A2MU-2W5I
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Jun 2026 20:19:32 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65BJ3O9R1389253
	for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Jun 2026 20:19:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=xsHObREKbSdD+QU63I499i
	xe+MAp/Ig/XpnZqBETjO0=; b=BeHWUk6nMly+ArnGiv5yR0XoL5qDVISJ2LohnU
	3SWuptIr1ybJRqcUIZ5VbVM74jhT0MUdjXWrt1iOKYs8nKVXQ30O+2OMyKvkt6Qf
	BsatV9aaA9Io1R60grJ53X25Kv7GbqPQvQhzlM5ivWoXuBrhrXmQIzf1LWEF013y
	mUcNQ3TQkSDk1r1t1VA8OLdwgBavOM6k52zAdX2vyB6NaiDlin1qzPPsQsPlTfkt
	PHL7X4QizfKxwWGU2z4hccWkXCRHRepzaGIsbCU7N9vjdjkg1Zh5IUf2gKTEhr2Z
	8Gx5lakHdG7nXB0ILB7IGfFk+V355UppxooUh5o5rdLHPH7w==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er1658tf3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Jun 2026 20:19:30 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-304c652be4eso953981eec.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Jun 2026 13:19:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781209169; x=1781813969; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xsHObREKbSdD+QU63I499ixe+MAp/Ig/XpnZqBETjO0=;
        b=eKte/TJ+lhK0jLt8DRLdkU2/3NuEHY7RcamXcN4b3fxOnsVwxAPRQRctaDuZQROVjj
         ZdZ+doHEDFWnZKcGtOTFH4/IK4zHjn3VIkxXEXhUO+TbPMYd64E1dn5rK535vC8q8+n6
         M9bCNfs3lmu/NubemWLZXGGcab2V5WRzdvHzl1z/DB8B+1nHjVmcvY1EQXFCwYrZdw+R
         k9MgJggFuze7KUSlEXZBWwRB+hE8xD7ix+F91rTjhDcGsj1vjS90DzbQ8yqhDw8rUDg2
         AOI6kvnGFojUsOvaeD6Efm9LWMCnONTCR1R7PvNaK8+vXlzfwB5XVcyryUJy7Sf9CyDm
         4Miw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781209169; x=1781813969;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xsHObREKbSdD+QU63I499ixe+MAp/Ig/XpnZqBETjO0=;
        b=DhoRwLOFmoVBfI9L69DXb0g3bZ4xt2SzDEvqkU8i8/YPc3sJUgp7GMOvNVMZO2gonQ
         0S5C4LurbLLqRz3XlVa66yrJ4Q4r8HLyEgfeQicwSgk29BeHVaV3hdZCSUTNNyzico3/
         51cpTm9hj5Qg3RfR50tkOZvjkeF1AGWuRBmEKATWp4rep2P/ngffIZ8F+ChROTeV39hW
         zj241Nq+ojI2IiCHfi8Z21AGCSjgNbaOMtVh+ETl4/cltggi+dYbpnIHiWT6pQ/eEnN2
         dBNANxa7doh1Nf7P8615pxkWvdJAaluQ4RpRhYNftjGEniQlYtBKBRMsDumqeW+v4Uz0
         RQlw==
X-Gm-Message-State: AOJu0YxkSbW7bGaTXWe9QvTPn/n+oO6HsD9sFMrz6SxzZDj0peXVyzqN
	ynMbjH8M3Gw1LzLrMXD+aiSv2g5ZrZlCZoBbSIKazAQbgXvTLGxLk7RIJ40EPcDxHT1hJmtLJux
	MNMq1HErhNZ6QV8WBtQHWlCfyGS+kDGQdDW/Vk7q9hfbE0K6SSDUJMHonK/o4Xmwk3jWwg5uDOv
	KtHM+cbnnrJA==
X-Gm-Gg: Acq92OHUV7wIn6rlL94uMotqaIhGldhejTTke9xDDO2PKf20SP6SN0CsdAK5Y89lkdM
	knjeaITiOnVC9VBEseK8BxBRj2zoP/3msrxKI3vE5BxFRjiGH6PzHgX16qVhixREI0/dBTPPe+3
	IMaMA/gtQcd0hnm40X795dDJTLxPuc7zecJAF0C124u7jtCK99xRTATsBm5dts2eT3X48qb+Ksx
	4PmntwEQNPZCPhM5w2zDJzgR8gUrVwpYYzeSlAq9uMPlXYZO3DbevOUMNzAGMHiNIfhFTYA2UoO
	2ET1DV3U6Snj5ioaLg9UdBII7+bjso+2FVtCsDEC+p1+1vTnQJZf0NI65Z7gykKvlyDPo8w3zDG
	4ePmiOt9+3J5BoJqdPSHu4tvoOTuYkONChEm135C2+sLVI0J+26nuAN5jABLtBnye9zy8Oh22CF
	kJObkGcttFBsWS
X-Received: by 2002:a05:7022:684:b0:138:e4:c4b5 with SMTP id a92af1059eb24-1384b41db5cmr168612c88.17.1781209169463;
        Thu, 11 Jun 2026 13:19:29 -0700 (PDT)
X-Received: by 2002:a05:7022:684:b0:138:e4:c4b5 with SMTP id a92af1059eb24-1384b41db5cmr168584c88.17.1781209168884;
        Thu, 11 Jun 2026 13:19:28 -0700 (PDT)
Received: from hu-uchalich-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1384302569dsm2658204c88.10.2026.06.11.13.19.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 13:19:28 -0700 (PDT)
From: Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 13:19:17 -0700
Subject: [PATCH] firmware: arm_ffa: Fix NULL dereference in
 ffa_partition_info_get()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260611-ffa_partition_nullptr_fix-v1-1-ec2b7ef7e130@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAEQYK2oC/yWMUQrCMBAFr1L220BMZQteRSQkddOulBg2qQild
 3e1n/N4MxtUEqYK124DoTdXfmWF86mDcQ55IsMPZXDWoUV7MSkFX4I0bvr0eV2W0sQn/hjE1A8
 xOuxtBPWLkM7/9u1+cF3jk8b2C8K+fwEThrsxfQAAAA==
X-Change-ID: 20260604-ffa_partition_nullptr_fix-66f37bb2630b
To: Sudeep Holla <sudeep.holla@kernel.org>,
        Jens Wiklander <jens.wiklander@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, kernel@oss.qualcomm.com,
        Trilok Soni <trilok.soni@oss.qualcomm.com>,
        Satya Durga Srinivasu Prabhala <satya.prabhala@oss.qualcomm.com>,
        Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781209168; l=1739;
 i=unnathi.chalicheemala@oss.qualcomm.com; s=20240202;
 h=from:subject:message-id; bh=ZOe2EDXU3HvsveItcr3dovmSWgaERH0mLdAj1V10jA8=;
 b=CZMhPQ3XeMogd808DQ+L5MTnTajxIAoKl+ZCFcUm46ejXXYUO9Pe3NeRdx4uXtIv77FJ67O9k
 awkaH8lBTMSCmpe46Wc9bROjAghTcsxdOBOi3kGJU8aODjwdv3Wiz0v
X-Developer-Key: i=unnathi.chalicheemala@oss.qualcomm.com; a=ed25519;
 pk=8n+IFmsCDcEIg91sUP/julv9kf7kmyIKT2sR+1yFd4A=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDIwNCBTYWx0ZWRfX2dXNZKAxUdJR
 f1eeaqdUwzrIAjbJ8HwePPkim/EKhbWJC1al132me+qtodZrVL7k7kx6F2xOr4gmsv+bt7RHVJI
 E2JnOzl9EV74dkx8suFBwuB65qkX+Qb84vQ9uQEqYS907SHZYpY4soTcKeQC6bMaoDoWxhbI1Pc
 pUNycLDMJaZXMUwjyldGzJPK05G4XfTh4n16RsyYun2oSYe39lb+JQEv7IsTMDU7KA+X9da4P6v
 a/TIk/5a3yGTrVSnhM/Qq7umE++0LZqGMQVLyBmRffaX5cpcOgMaU2N2ub5Y2SfT/hxJYT5slz4
 bRymzOf7sb0b3TVO+KD+qC1ZfPRwqbY+GbiFOdtJ2w5OdUGdojQ5MSa3OtcySH49OqO4TcV+WHM
 RExj04/d+QR9orJmuMF7ney6fmMfwy/8tMH0XO2cfHCFwiO0JBE58gzPZKc+XBqr9WL0eDkUXd5
 UrC1EXvgJ+rjBPItwaw==
X-Authority-Analysis: v=2.4 cv=LNpWhpW9 c=1 sm=1 tr=0 ts=6a2b1852 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=DNyTkGw6iCim7eFMS8gA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: dlVLerYS1tQdm1j2ShS80BC2MIaniVWq
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDIwNCBTYWx0ZWRfXyRGKGvw/MjnK
 fKHmF0x3xHwExyze9Srf8UI/x2t/w0jdipf2rKrghvOd+xxwbwIlHO88vfyS2ooWd8r4XzgfFY3
 widDad6c6E8IushySu9hIT8ohwVJu+I=
X-Proofpoint-GUID: dlVLerYS1tQdm1j2ShS80BC2MIaniVWq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_04,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 adultscore=0 priorityscore=1501 phishscore=0
 clxscore=1011 spamscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110204
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_131931_644122_DAC4DF80 
X-CRM114-Status: GOOD (  14.70  )
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

ffa_partition_info_get() passes uuid_str directly to uuid_parse()
without a NULL check. When a caller passes NULL (or an empty string),
uuid_parse() → __uuid_parse() → uuid_is_valid() dereferences the
pointer, causing a kernel panic:

Unable to handle kernel NULL pointer dereference at virtual address
0000000000000040
pc : uuid_parse+0x40/0xac
lr : ffa_partition_info_get+0x1c/0x94 [arm_ffa]

Per the FF-A spec, the all-zeros UUID is the defined wildcard that
instructs the SPMC to return information for all partitions. Map NULL
and empty string to uuid_null rather than crashing in uuid_parse(),
preserving the intended "return all partitions" semantics for callers
that pass NULL.

Fixes: d0c0bce83122 ("firmware: arm_ffa: Setup in-kernel users of FFA partitions")
Signed-off-by: Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>
---
 drivers/firmware/arm_ffa/driver.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/arm_ffa/driver.c b/drivers/firmware/arm_ffa/driver.c
index b9f17fda7243..dd500fb81b79 100644
--- a/drivers/firmware/arm_ffa/driver.c
+++ b/drivers/firmware/arm_ffa/driver.c
@@ -1129,7 +1129,9 @@ static int ffa_partition_info_get(const char *uuid_str,
 	uuid_t uuid;
 	struct ffa_partition_info *pbuf;
 
-	if (uuid_parse(uuid_str, &uuid)) {
+	if (!uuid_str || uuid_str[0] == '\0') {
+		uuid = uuid_null;
+	} else if (uuid_parse(uuid_str, &uuid)) {
 		pr_err("invalid uuid (%s)\n", uuid_str);
 		return -ENODEV;
 	}

---
base-commit: ba3e43a9e601636f5edb54e259a74f96ca3b8fd8
change-id: 20260604-ffa_partition_nullptr_fix-66f37bb2630b

Best regards,
--  
Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>


