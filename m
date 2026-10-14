Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32603CC6B1D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 14:12:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zk5hWYH70JWIsSNHUG0zRgHDEQ1zmkkRy7qUkdHZ12k=; b=PK3wiXLkgj7ONop9l2Nm6OM7gs
	GgLuh4L1eOAS6mQxYFfw4iaXwh0Ey7a9Oo8R4r+VpU+n6f29SCvjPwquo7KLsiwfpy0XUs/yilC8V
	2/a5hDSIhaYfJWv5nZHbV8FWjez6uAmljYX+sSGHvxyDy4B1LNnrCdPOnBuQGqgvBacQVHSa6s7iD
	yCuA8hYOWwLn3fto6EeyDipufiQ1pmbsI8tvdnB3ryk8Ada9PLDRGyRSkmZOeqmIFEUUEr6L5EtbY
	f2A02wcLtCVoc05TKLjt64MhMJUiME635mMB5uuT51jFJzkgDnYXj1pNB4NaCsjKqfqoPg50ODaNK
	/ppY6dyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGziO-0000000FgtX-3N6p;
	Wed, 14 Oct 2026 14:12:20 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGziL-0000000Fgrj-2tP0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 14:12:20 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EDEDgF2874347;
	Wed, 14 Oct 2026 14:07:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:message-id:mime-version:subject:to; s=
	qcppdkim1; bh=zk5hWYH70JWIsSNHUG0zRgHDEQ1zmkkRy7qUkdHZ12k=; b=LX
	E/s0RM+Z2A64Eem9kIrsT9IRww5V8PT20HLjHNVJQjjAuzp4aAR9sEhPnxBR7e27
	ftEAAMKd2nPcwx0BDvihalEhcNOXsHk+bb6QAM9Blq3EoA5h1Ul9FwpkRdzz5A4q
	pyNFYzUMWcjy0Ep3TqwXKcLHZPEeKsd0UMz1uL0X7VV+KhlhwOLbQZ0gNX6k0CiO
	xaQ2cjUp2gVMhyp1HgqthvUh48IwhOvi3YWx+KHKONTf+wZhXAgJ0gx1nfqgd1hd
	fN56DDWGnUdpzwd04d7ZbFaop9jj+UlxA4Vmrr/7ajnRPq/Upjw6XWSMugUBlPjq
	H7B6LKCgdPRDOqiaCl9w==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9yphjwj4-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 14 Oct 2026 14:07:05 +0000 (GMT)
Received: from pps.filterd (nalasppmta04.qualcomm.com [127.0.0.1])
	by NALASPPMTA04.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 69EE745F2899483;
	Wed, 14 Oct 2026 14:07:04 GMT
Received: from hu-sukadev-lv.qualcomm.com (hu-sukadev-lv.qualcomm.com [10.81.26.104])
	by NALASPPMTA04.qualcomm.com (PPS) with ESMTPS id 69EE73Bh2899462
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 14 Oct 2026 14:07:04 +0000 (GMT)
Date: Wed, 14 Oct 2026 07:07:03 -0700
From: Sukadev Bhattiprolu <sukadev@qti.qualcomm.com>
To: will@kernel.org, robin.murphy@arm.com
Cc: thunder.leizhen@huawei.com, tanmay@marvell.com,
        linux-arm-kernel@lists.infradead.org, pdaly@qti.qualcomm.com
Subject: Support for ARM ECMDQs
Message-ID: <as+Mh1Ah3FFpCZlK@hu-sukadev-lv.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-GUID: lZFSn_ss5C36lUsrTq87kKFjOyp9R3z1
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA1NiBTYWx0ZWRfXwBx0Lb1Fo9sh
 hTk21WuZvAkjACz/1kKlIVk34b/mi7nwJH/NRhSp+nuDwUfS3+OUt4fEH0CaV32LgLv1CzTV1Z4
 JIrAD5nTQYJ0Vv13quV93l/A3Ecy2Yw=
X-Proofpoint-ORIG-GUID: lZFSn_ss5C36lUsrTq87kKFjOyp9R3z1
X-Authority-Analysis: v=2.4 cv=Uv72pOwB c=1 sm=1 tr=0 ts=6acf8c89 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VPW9pYw8AAAA:8
 a=-6Hl5Qg91nM7B_aReKoA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA1NiBTYWx0ZWRfXwqI5ixxVL/Vo
 T+GMf2GPaHyeo1fO14kts/FZW/wQzFIFxNZfO29Pw1UiSh2qwZ8Mu8pEPKHXjPL+LA/50sdOAEZ
 vbMktF4Ypz6J4QbL07PN4RveCpwkDB9odfIQuQ+6/r36MPSW+a4N/HaK+qvxJJ9Q+XKttHLK2Xk
 r83BPzYA/1jTOnVswGvBWlInNoG4MXnMYdxOo6rEmT0SlfsvTr7URuRHKBwbiGd1pGWCnNC81ke
 SvvN9L+FVW39t2EM9l3ssQ9edrR0mmgr5yRNUKI4XY1HiVpeNXds4/sWrvXYXn8tHrr0PsA/Gpy
 Vx4oDSrwwPZQQQhky4ySL+SdZdjcMSdSz7ojG8rM78YxofEMJp4CwcpBy0rB0ARsx7yJi6ysDul
 Eo5Zz56mHi7HGRvT6goYjFYJh8WkwOHJVc9vaVLBsmmvqfLR5vJGY9dOHwPHVY9mc5ywor1DqkJ
 PtEAeGDGtSv4SyQ5VBg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1011 priorityscore=1501
 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140056
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_071218_722227_86370135 
X-CRM114-Status: UNSURE (   7.40  )
X-CRM114-Notice: Please train this message.
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

Hi,

We are trying to understand the direction or ongoing efforts to support enhanced
command queues (ECMDQs) in Linux.

Earlier version of patches [1] seem to have stalled due to lack of real-world
workload data.

Also, any recommendations on policies to distribute available eCMDQs - one per
CPU as in [1] or, round-robin when # of eCMDQs are less than # of CPUs or others?

Thanks,
Sukadev

[1] https://lkml.indiana.edu/hypermail/linux/kernel/2404.3/07988.html

