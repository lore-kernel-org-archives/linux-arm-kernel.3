Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C68C4606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 15:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LHBT0cbs;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=O1u6Asj4;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cHBmDvEb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8J4j0djyVVFC/C1z8k5Rma/HbptDjpjZS/vt1pUoijY=; b=LHBT0cbs7SY1fIq0PIj01jzurI
	vpkDykG7bYSdNDnm7FQoAsSaHIOPVaXQBXUhZKrt5hPyoENNBhJFtiQadF8gr0JOQtvyhC9EYt0ca
	+lwhAQL2sgBoEdKp7YW3MXwxQ0nl/1N9EmSDBc5umw10yDFwQ1730y6xr57AOI+G7VPSsgPbHR6ag
	PNUzCndUpvt7W+We2ClnUK0xzjLOMAfkDg5q+AOaL3GI7Fi/3aYphbN767XLH+tPR/uIqwfb/g2lL
	p8VRC/Jsa/AIEGu3EXHEKNLXj/FabFrTBtVAUwor1noWK3pKRp24i3khpM6h6dkWBwtMN8zpGlEXa
	HEtlmnXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJAf1-00000009uT8-3jTE;
	Tue, 20 Oct 2026 14:17:51 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJAes-00000009uJl-2Nuu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 14:17:44 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KDA1ID1209355
	for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Oct 2026 14:17:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=8J4j0djyVVF
	C/C1z8k5Rma/HbptDjpjZS/vt1pUoijY=; b=O1u6Asj471qzv8lGc4di8WmrEup
	+DJtLvvwD5gLoCj0Kfqmwnbvj3SUqfuDtfGq5rWZaSa66O9VGQ8X4SmJHkSiJYcd
	2Tq9bPtyIAW/W6XskJSCNhA1aEivFnqcx3B1Aji9aLbEtoMOyeoz1J2YoZsKxlOL
	F1Zb+KQAlT3+xZT5TPU/oXEi09LqG8zy/klXnsdRHnRI2bsS9ywkeZn7fzIMfloQ
	P1K/NN71OHE5VlZE5//45yBAQcPTWFLp8zqo8sUUB3P+EzH5DMwgyN4d679N0pus
	LJhb/IiXkgx9RGeS7LIbvn+NYcRWjO0cHZhPb8PudVNbMUopp8DLb4sGcbw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5pav0c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Oct 2026 14:17:41 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93ce7a85f04so657976785a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Oct 2026 07:17:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792505861; x=1793110661; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8J4j0djyVVFC/C1z8k5Rma/HbptDjpjZS/vt1pUoijY=;
        b=cHBmDvEbu1Dm8xw9eGX9JaLwzsLEsZHBf1nG7pTlIklMMuQJAz7gsNNJLaPH24vA7c
         35sUt4e1i3/5MkyWp3ijuv6vJdevSD+o/5e/Q0yBWl889S+fctpDPHcYa0uAJ96k9iTN
         is5ZszSfrHs/h6pIwuKXPXZjr9YKxcyQsV+6OdCFzL1wGmDYluSZNdP2+T1TkSsYhh5G
         vaoJZIPuj5tiU7tdvJdcwP1S+quCACfoj9vHBDjXAqS+zZLUaizuKclOJ0CL1LmBwQxa
         evSjcw3JDu+WBkmbr8k3INFtxMJY0egGn5jpZLG6LEOXhYDegAcnK7mRJHH77nM5vEcN
         HySw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792505861; x=1793110661;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8J4j0djyVVFC/C1z8k5Rma/HbptDjpjZS/vt1pUoijY=;
        b=AVwAe9hhaiFFSAmN7Z3Gd87UX8FDRif+yN6nnPI5yPtru4Ko4z8Pe1/OTE2hqtVtJn
         5D56K8ZGAK7DfmhDqKD4qXepVpC4NDojJD7ara+IxF04lG+m7RiUbNT+KV1eY9I/dcRx
         GbXai12T9AlGY5aktB6FjJ1+napMEpVZ3PC8mUrPkcmQLSKzIdHGoYC4bQIyjyNtlzJk
         Nz6NYJmk0y5iaMovVgX40GrspKMHlJDuPxFqmVPf+9HwFQEQ2qm/4/1HoQKO6CbksTFi
         LxRuj3dfeN+iTf68aJKkzkycaWAscmVTbpZqsRSt+7U4BNX0L7AnwOmRm7PU2oSUr7fY
         iCYg==
X-Forwarded-Encrypted: i=1; AKwUvByElMnSe8A6gd5T7ktZJA/MSd7yJmkFGpxQ6I46TOrEHxoDvIwThRXHzV2H2GqYLVEOVJ84aP3vkGGsrgc/rnn1@lists.infradead.org
X-Gm-Message-State: AFq9FYJQ+56G0Efzk5lRdddNMHGB46zePDge4ch1Elno21po8RHuEaut
	aCWYdOXivsDEi2FQs1KIXPzMeiYacus5jhMu3mPdRR9ZqO/BYbIsfWQQyl9PZbo0EQE5ySlOptn
	d/lrKTxUHdjyU+ETmH4cur/00JOREM7bnEJzX5E+WW4jXav/jtOX/TgWF7r83UoAZnCoMdBAipf
	e4GQ==
X-Gm-Gg: AYBFou2CTpNZGBIToTIzyCvGJf9WLbvnVcvtE6vwpjvdfISvS6cvAOXmYG4qjy1CoOk
	MMythENjcaJWbjqBYA4y7YHLGDpjNt8RduBZlewAyaqI+ZX5OREzeBd/ZVwLCgANb+7s240U0f+
	FOqPW46KV1oVElaMvn7+RM/tCdK2UuHPTNRoBrDJmSrjW7wZRPA+mdk7887lABiQ/DplXaSWn7Z
	vsyb3uC5/BqQdN9yUyK0hILc696cwp55m1NkXOu6ZwG+r+57gFNLZqR6G0kNsBR7x2LaX9VZTni
	A8pmtRoh5D6XT2FhIE9mAfRuhmnD7cj3wKYb5rjVbM73XsYnO4dV4jLYMRafVJ7gV+t+JpuouAs
	NpEyLrw0nVEdssfKaTdpYTh00Fp4=
X-Received: by 2002:a05:620a:19a5:b0:93e:b0c3:388d with SMTP id af79cd13be357-93f29b7f65cmr1936775485a.11.1792505860714;
        Tue, 20 Oct 2026 07:17:40 -0700 (PDT)
X-Received: by 2002:a05:620a:19a5:b0:93e:b0c3:388d with SMTP id af79cd13be357-93f29b7f65cmr1936767785a.11.1792505860129;
        Tue, 20 Oct 2026 07:17:40 -0700 (PDT)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:4884:6e9a:d9ff:9fa6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d810043sm6642276f8f.16.2026.10.20.07.17.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 07:17:39 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: rafael@kernel.org
Cc: Daniel Lezcano <daniel.lezcano@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>, Shuah Khan <shuah@kernel.org>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kselftest@vger.kernel.org
Subject: [PATCH v3 3/6] powercap: dtpm: Remove duplicate RK3399 CPU hierarchy nodes
Date: Tue, 20 Oct 2026 16:16:53 +0200
Message-ID: <38f5964cadd33f8b03afaf9ff740653258367d72.1792504834.git.daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1792504834.git.daniel.lezcano@oss.qualcomm.com>
References: <cover.1792504834.git.daniel.lezcano@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: EFybrfl8SFSVqkf-aPERyh6JVUmzpEx2
X-Authority-Analysis: v=2.4 cv=fb84WEQF c=1 sm=1 tr=0 ts=6ad77805 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8 a=EpzjDTW3ywHV2UopgxgA:9
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA1NiBTYWx0ZWRfX8RuWZmfU+pvu
 NVeW/LUfV/d7mIymrQy5OTchA7aZ9Dn996jsNZ0f+DYEyW6g49YFAprRscCQboejYHSs4I7kzc2
 ndTlOoyaQkX5fSm5bqBtU818XDOEfTmFGtWuD8ZYPIvJHZyvL4HgwQCCKvJZwX57CdDaQVKT92w
 T9GFS51pOeDGMnt+8AJlXcmyKcRpFm0GJGzMcS0UFu7E6dLfe8OKmbx88UDSNOBjOlmLLbNSlAB
 vAOxwbjw2gb8C5NXdOl1SkOHorVNp7IVC0Z2gDxCFw5RNljyroHANUujY+5oDXDD3OR8AsVD+9K
 lTFADT//HTVAGXJUW2Mk+icz42Q8+oa/B0iRlV1A9D1xBnwt+4kChHDdHgCrsJ6ak+l/W/WhQJ9
 2L5/yxkFgHW9jdF+4YIj2iE9GVDQLwoDimVsjGAaxxXsUdq+9ro+v986BGcIfXnRyBXjRGE5+TM
 X2E400mPA5Q+gacN1mw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA1NiBTYWx0ZWRfX+Uk0GDnyGMW7
 utBy7mfrrwDrSnXO+j0kBkoHzl+M95ikDjkUqM/6yyGcTmFDOKglk5CE61obG/iVhSU5xGbFWV+
 1/8gPJ62OLmpow4qxHelDfFMunjPbmE=
X-Proofpoint-ORIG-GUID: EFybrfl8SFSVqkf-aPERyh6JVUmzpEx2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 phishscore=0 clxscore=1015 bulkscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200056
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_071742_913232_90525FAB 
X-CRM114-Status: GOOD (  18.18  )
X-Spam-Score: -2.8 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The DTPM CPU backend registers one powercap zone per cpufreq policy,
not per CPU. On RK3399, CPUs sharing the same cpufreq policy therefore
map to the same DTPM zone.

Remove the redundant CPU nodes from the RK3399 hierarchy and keep only
one CPU node per cpufreq policy. The backend already suppresses duplicate
registration through its per-CPU state, so the removed entries are
redundant descriptions of the same zones. Keep both CPU policy domains
and the GPU in the hierarchy, preparing for one created zone per generic
hierarchy node.

Also fix indentation in the Rockchip device match table.

Assisted-by: LLM
Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
---
Changes in v3 (since v2):
- Rebase on v7.3-rc7.
- Fix Rockchip match-table indentation here rather than in patch 1.
- Clarify that the existing backend suppresses duplicate registration.
- Add Assisted-by attribution.

 drivers/soc/rockchip/dtpm.c | 22 +++++-----------------
 1 file changed, 5 insertions(+), 17 deletions(-)

diff --git a/drivers/soc/rockchip/dtpm.c b/drivers/soc/rockchip/dtpm.c
index b36d4f752c30..e71f315fbb6b 100644
--- a/drivers/soc/rockchip/dtpm.c
+++ b/drivers/soc/rockchip/dtpm.c
@@ -20,30 +20,18 @@ static struct dtpm_node __initdata rk3399_hierarchy[] = {
 	[2] = { .name = "/cpus/cpu@0",
 		.type = DTPM_NODE_DT,
 		.parent = &rk3399_hierarchy[1] },
-	[3] = { .name = "/cpus/cpu@1",
+	[3] = { .name = "/cpus/cpu@100",
 		.type = DTPM_NODE_DT,
 		.parent = &rk3399_hierarchy[1] },
-	[4] = { .name = "/cpus/cpu@2",
+	[4] = { .name = "/gpu@ff9a0000",
 		.type = DTPM_NODE_DT,
 		.parent = &rk3399_hierarchy[1] },
-	[5] = { .name = "/cpus/cpu@3",
-		.type = DTPM_NODE_DT,
-		.parent = &rk3399_hierarchy[1] },
-	[6] = { .name = "/cpus/cpu@100",
-		.type = DTPM_NODE_DT,
-		.parent = &rk3399_hierarchy[1] },
-	[7] = { .name = "/cpus/cpu@101",
-		.type = DTPM_NODE_DT,
-		.parent = &rk3399_hierarchy[1] },
-	[8] = { .name = "/gpu@ff9a0000",
-		.type = DTPM_NODE_DT,
-		.parent = &rk3399_hierarchy[1] },
-	[9] = { /* sentinel */ }
+	[5] = { /* sentinel */ }
 };
 
 static struct of_device_id __initdata rockchip_dtpm_match_table[] = {
-        { .compatible = "rockchip,rk3399", .data = rk3399_hierarchy },
-        {},
+	{ .compatible = "rockchip,rk3399", .data = rk3399_hierarchy },
+	{},
 };
 
 static int __init rockchip_dtpm_init(void)
-- 
2.43.0


