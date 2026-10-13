Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B3FBCC6B0F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 09:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7l5zIcx1UL+ezYmtByDdHSMtk7pozUTglABDARGqPqI=; b=iXlWI1W1++OPXYUTz23gzrK7TD
	KCuXp8JBFrKsdpzaw1Emr4mqEGNPBUCtpYDkAazoZxsB+sldzEax/fozyer7SMJQ6dpVARU9KNI+C
	OaOBh8QixIVB41HhhZ1r+gIlU+pYWbG9E7lYqiybUmuKP/aKZe+pmyuLoFkDLzGtXzLUZKZo4LaqB
	nhrXWwQH4yIrzbFKxu0iUQt9H3lGPXoc8ucitFAemMTeKbYUUxkfABaBdSa2hV23EAcJy7NQYNjP4
	ocGWBSYYo1i4KvGTsHu4Hi+srSrdilA3XKhZR773o62vNIwUoNcO0qCJvezaovHGMIeY68yIli5Ek
	Cjnz7HyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGZHs-0000000CVLY-1IXK;
	Tue, 13 Oct 2026 09:59:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGZHR-0000000CUxz-18fh
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 13 Oct 2026 09:58:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=7l5zIcx1UL+ezYmtByDdHSMtk7pozUTglABDARGqPqI=; b=VkcUrPxdxn3rXpiKLUH66YRT4u
	XwicTq6GeybGooIMxJgBSQp/o+48LPiMOL8FNeWZo9hvG79rXc0iiH14Av5jt896NRtSLAddjHdHD
	k0hiISXOyFoaQ/Jjy4et2V36uK3Mei8e4eTI6Y8y678fBoCUFML0EU5sfBvlOwW/sAGVPSgchUT6V
	ZCV1mrHq3TCvkFIu4VPOAaxGWa00VA7zjS8Jq45nMjuaOpIT4uDUXUjQS5bijENwZ13xr8FyPHwZ5
	Oha7i6hqljJp6X9gJ6cH3FB+mH5l3O1i8dHyu8Vcl+QkrEh98H4+cq4VNlNw5GIep72j+ANTsSN/z
	2ePGCWuw==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xGZHO-0000000FNfH-09JO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 09:58:44 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D8jiUj989363
	for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 09:58:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7l5zIcx1UL+ezYmtByDdHSMtk7pozUTglABDARGqPqI=; b=fwWoJpbELLjhH+E5
	rVLT8bKRY3TvoLrTgh1SXBAUlnJXNC2FOb4UHkdNuiF6M85CkbNix/v99ywW68m7
	v7PtmH7nQV9xVukglJerRqbsTJpZCYspAdlRecn49uqlgp9p7mJ07hyyHGLQlKv+
	T7Nclhyf4fOdZJLvbhowSs3vwis394fFVY5/Z31b/YjnWHv+Db9kHoqll7hpXO8p
	4jV/51PqnJ9MCDSFtRXOPcUSOPw529U5apc7TLJqgSBw8CfMl1i5TmYk26JhCkk5
	ioqmJQL20nqEqQl7EWEZRTgdFKRrZA9ZKvc3b1caK+biLvcSmiX3roITbxZY2jjr
	HQOn5A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h98hcaacx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 09:58:39 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-936aa34873bso570964585a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 02:58:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791885519; x=1792490319; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7l5zIcx1UL+ezYmtByDdHSMtk7pozUTglABDARGqPqI=;
        b=Sdrq4fKZBX4GQg3cxH5Qw5dCQS0Jpv8Yvgl1xvglTQCnr22dkeaOoehS4WEY8YP0bP
         9r5EAhGTogW3rhwGj+wFpG2zBV5T/FZQzGUCfljYJi/c5cTs1AEKpPWwdVely3ZswDLW
         zOsartvogwQ2fHMMoOTWxUaLnFQ/Lop4b9BD3bgu7pPelgLgYJxvfZ3HFpRT8RixjWbE
         iKyK01YYA8kL0eQ6SeGF74nCIugVe4zUHKXiu4CZNR8yqQRhJCu71sEG29c6PPRZLPHH
         KybkLAL4cYz93R/YhjF+5pXdDgiZ5//i9jrj1Tcv+GBYcEYwTigJwqVZftfLepaEub2X
         2Ahw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791885519; x=1792490319;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7l5zIcx1UL+ezYmtByDdHSMtk7pozUTglABDARGqPqI=;
        b=SbX/V9R0OP+Rlm7K3nDfu60LwjJ0l2w9+NG9KRkzSiNcBBp1EFEgxwP3APyYZl1SE7
         VxHon+TErzO5nP3LnC4kQnBx4Xi+BDcEnTKFXI1QFzrM4OnnBGZDqUE5PWM4det+a1Q1
         Km7DBVLbqLemS1bRWs+637bqNOvrJkATnrw53S65jeqR6KVQ9HoBdjnMEX9oi+AlS5Nj
         D+te9h7cghfZ6y/OvzlvFQG2AplPZQhJ0WKHZfP9ZH3jIzB1EV+jNEn+xvVYT0sW2Uod
         ymJ8bOh2AFSv2y9pVqDQtqwOaaJK1aOY+I0rxgsiqbaW9KFRsS/ZqXxc2VIU9UoFTbcE
         73GQ==
X-Forwarded-Encrypted: i=1; AKwUvBwZqftJYyMRJw6e2/wXluuHQDVn6GZffrD84xShvmrgxCwC2BgU/toI+8KFkjFFDAoHCNfSN+I8ZAk74G3TFvhs@lists.infradead.org
X-Gm-Message-State: AFq9FYKm4LYHo+p5dCMS8jJh1Uo2cs+M4r1iSmbK9TRwUzO+3QZjqZGY
	J6+dpWvv+6paXmVIbXUmKWppy8w+Pf0qQP3qGJDY26NRTkbbUfy2tjvEGEhnujBBsSBTy0SliGh
	aJILv2Xi/PxPNGbd1U6NEtKdr/vyjGWX6xNB8gneHYnC9hbp/mOmgdDn4w3245I10zGNKEIICMZ
	w2hw==
X-Gm-Gg: AYBFou1a2Sq09qEcyJOAhXKeC0+ZJU+fDPW1Xzq9IqrqVo215JKy6LwyCKS+DC7qgth
	lbpdBNITJ3thzlXQmYtTlb4M8GHz7xEFe5tZQo0MH2+9v+v0jKXNrJo0qI+kbE/qx67p+mlU3V5
	3rn6EzXdgNVXXlClLD5VURhe/wz8ejNzfXE3m5eAWimXdm0gyDUlrIlHBt7B3GvlXjig17BO8Cq
	5uF3iXjGdV1E+L+O/2Q9yixBKT9buNDXSkGsx9nGjPCkpMbCsbIDpJJSkjiGwObM/qxQ0eKMSwk
	biuZ9R+2xRNzsEkt2vwGOpK/2oe67awFZssd1FixshU1k9HS8SYMiYoGGzaLSPD9RW5QfBf1BY0
	HWhuDxPg9A2e4sj7VmkmLj/LBnPnl
X-Received: by 2002:a05:620a:a416:20b0:93e:c12c:9b76 with SMTP id af79cd13be357-93ec12c9f3cmr1306894885a.81.1791885518978;
        Tue, 13 Oct 2026 02:58:38 -0700 (PDT)
X-Received: by 2002:a05:620a:a416:20b0:93e:c12c:9b76 with SMTP id af79cd13be357-93ec12c9f3cmr1306892185a.81.1791885518508;
        Tue, 13 Oct 2026 02:58:38 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bb6beaesm209412025e9.0.2026.10.13.02.58.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 02:58:37 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 11:57:43 +0200
Subject: [PATCH v10 14/14] arm: multi_v7_defconfig: enable the Qualcomm
 Crypto Engine core driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-qce-fix-self-tests-v10-14-57162a38a554@oss.qualcomm.com>
References: <20261013-qce-fix-self-tests-v10-0-57162a38a554@oss.qualcomm.com>
In-Reply-To: <20261013-qce-fix-self-tests-v10-0-57162a38a554@oss.qualcomm.com>
To: Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Stanimir Varbanov <svarbanov@mm-sol.com>,
        Eneas U de Queiroz <cotequeiroz@gmail.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Eric Biggers <ebiggers@kernel.org>,
        Demi Marie Obenour <demiobenour@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Russell King <linux@armlinux.org.uk>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, brgl@kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1386;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=FAikOuYHitZp6ddVzGLa/+G6KPECbwnoEeE+84cT8FI=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqzgCmLFOSLDnOzisgehD4plX6X6ibyG32KeR9V
 0FH01CKIfaJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCas4ApgAKCRAFnS7L/zaE
 w3xpD/9OZVnqav4CittjDEhTEYHIZ3M45w0MMZUJ9CX30r57sfLqXPF0U9r+OTdlYsSKku6yDNT
 miL26KRahsmIvZEm9IrTzcD2NyjICa+mWOcPOx4oNH+ygzjM2K6nTLgIHnS4QV+aGRwyLmB5K08
 jiz2B1bLioO9kSxrRkRGhuxrc2h+s3t0mR7pfrP7COm8TceDp8WovkW9tbgC3PaoMzVImntbJq6
 uKR/OuH1gtxv77nf7bXY5fLuD/UVfJheE9uvdK5ffovjs7sbTQg3r0J3cCn4vsdum2RPB5yVw4X
 YqkTQxBeTDr3a1V0I4w6nXto/2R4if1l1rfA65vzx9Y85AEWF8GUMDwE8jD7PbhSaFjyA5HskaJ
 SbYTjdVC4wE57IYSx3gsyukClHmGirYORlSVrWc73ejV3xq3iVN1fkN4++G67GTU5S+MpNcpRaF
 CrF7jGzpcvl/45w2frtrHKEVFLFOLT8usKWiMEzemY4kzaswWMoGtWHuOphpeAB5H2QLjBSL6ZU
 f3a9ysM9MW/BdxM7JbQXd2/zVYC3gCW7s22TbXxIiQdFmlymFtRWAD8h8oAcdZLgsvjl19JgTdN
 SCjeNJHW9vuofcUYuCjg4XjTo7WHWlYQ8AQcKawKR9NNXjh/jrDPUs34eCEcenlrmAw4ov79OcL
 wJ+3X8T/1Fjm8XQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAzOSBTYWx0ZWRfX17mGvTKUt2he
 aIRMq7vCSX/Ae1M0TpY/v66dUuNyXE72rnsAgCS+NhyByHltn9bhmykTWDOYVd86qcL4VugQpLS
 NCKWijK97bGTPT0+IYCLBXJ6Y/Ra1jFCOWE5SLHHrX6FlsYuQMd/rpVOQ57MEUuYNLQZRpjfTfr
 Ok7W8cmrCmtgezsZaLPyS/JdX+7fYqCGdW+RIF3Bn9YS+mu6qYoe6Lr9fOR6DIh8KAeePIsxHg2
 17UPQK83/Zkw4IL43hrvc5EmCnvmlha1EWJLZno18BBvd5zkcFsViebySesP08RmQiYLlU4fxdY
 S7v7NyYq0fdPEUhlKEKDBzXHbW+fjWvcX6SlNgMuXQNTXkhNKRKk2Y8TykbfAG8EK1zh73dE50t
 XmDT0pjrI21fGcXMuJi9DcqVPumvkEB4S+0z9FhfIKU04n+MJx8Lq6s7Geks707pcjgi5xC/5LG
 DwiIve8FTOCtByPl++Q==
X-Authority-Analysis: v=2.4 cv=VPVIDNPX c=1 sm=1 tr=0 ts=6ace00d0 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=QftN5WpXeUmWSfsFEiEA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: q_KKyXKra-_llxTq9WIlnKqmcIXIEDfq
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAzOSBTYWx0ZWRfX3hx0YZrw00Gb
 bnSLTFf5AohekJgun8q6BNc9/Dwupo4GrB0pubCWSKSrzb3K7A/GhecdfM8wkGrZ3auFNqHeQQW
 h4I8kpz9rLQ50v+78WPS6xEE9fwithY=
X-Proofpoint-GUID: q_KKyXKra-_llxTq9WIlnKqmcIXIEDfq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 adultscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130039
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_105842_680992_C091049D 
X-CRM114-Status: GOOD (  16.23  )
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

The QCE core driver should be enabled by default as it binds to the qce
device node and scales down the interconnects if no child auxiliary
driver is using the IP. Add it to the multi_v7_defconfig. Disable the
crypto part of the driver by default.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Tested-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Tested-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 arch/arm/configs/multi_v7_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index 2d6292f8cab39596b540084fbd8b30f4c25cd4ff..7750b11f80312bf6a6f0fb276315f32f8714b4dd 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -1150,6 +1150,7 @@ CONFIG_QCOM_SMD_RPM=y
 CONFIG_QCOM_SMP2P=y
 CONFIG_QCOM_SMSM=y
 CONFIG_QCOM_SOCINFO=m
+CONFIG_QCOM_CRYPTO_CORE=m
 CONFIG_QCOM_STATS=m
 CONFIG_QCOM_WCNSS_CTRL=m
 CONFIG_ROCKCHIP_IODOMAIN=y
@@ -1323,7 +1324,6 @@ CONFIG_CRYPTO_DEV_ATMEL_AES=m
 CONFIG_CRYPTO_DEV_ATMEL_TDES=m
 CONFIG_CRYPTO_DEV_ATMEL_SHA=m
 CONFIG_CRYPTO_DEV_MARVELL_CESA=m
-CONFIG_CRYPTO_DEV_QCE=m
 CONFIG_CRYPTO_DEV_ROCKCHIP=m
 CONFIG_CRYPTO_DEV_STM32_HASH=m
 CONFIG_CRYPTO_DEV_STM32_CRYP=m

-- 
2.47.3


