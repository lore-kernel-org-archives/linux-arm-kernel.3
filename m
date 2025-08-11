Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB2B7CA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Aug 2025 22:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i8LsXBMRBe/Icg4da9jE4AlWAsPYCbJGuzx7DJqs7+8=; b=0CPrhcOZBbG/dZ3RQVMPXhyZsS
	umebC2IhqJPI7rZ+J1Aezjq+vNtYoKfWLPi6/K3S48zoxhA2H5kG2+ph0soklobaVT4wQAMnzRdQH
	poEpFnhfThPq+Npasoxw9u2JzxCi06tIKlWOdha6P92Jf3qtxPlUiuqtvLb/QP3CXBfQYamTUXjta
	rzICV9kBCFG9KH7sZfQDatlLPxXJ7AsMVaDWVEFt+Ofc+8IMiUDldh7bBZt+BwQqMLHxDYAHJl0mf
	WY3eRJMwoH9oqKZvk4NuWRwb4w+yLfncy9CJBX7Tf0yJXCPZvufT6bslHfua1A6WmdFehxdYo+gua
	pQMgwpWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulabZ-00000009Arj-0I0o;
	Mon, 11 Aug 2025 22:02:57 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulVfk-00000008SfM-30kw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Aug 2025 16:46:57 +0000
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57BA8WMr027956;
	Mon, 11 Aug 2025 16:46:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=i8LsXB
	MRBe/Icg4da9jE4AlWAsPYCbJGuzx7DJqs7+8=; b=pvUcqneqANvc7ZJ3wXGNpF
	8d/UNG2ORVtv9z8kuz1JFSj+2Pf307wacnhWibXtJ8MvSudc2ZRNc6MALykKZysf
	p9svoc9ee2SxmWSto1ih9W3gx9757J/a/K1EsSGhlnYJyJUn6F8bAdJLLilQAvUx
	E/OrYd6sUwcZ/+tbMhVNqOLWFMq5narkdFfsWfMP/rv3yp79pxqR139nJz2Qy0N6
	ZnmQkT4EYmlu63YOcnCzC9oL4KXtPqd4VIotCVAuOB1aF33VN93o7xoUYtGukMtj
	rd51vZ9kuqEOcgF6gFkgXCKIpKu7k6dicxxpXbgix/vXQtf1ZBQ4AN8ahdTQ6eSA
	==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48dx2ctdat-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Aug 2025 16:46:43 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 57BG7uH8017617;
	Mon, 11 Aug 2025 16:46:42 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 48ekc3ed6b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Aug 2025 16:46:42 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 57BGkeJZ47448424
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 11 Aug 2025 16:46:40 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 59F5A20043;
	Mon, 11 Aug 2025 16:46:40 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 023E020040;
	Mon, 11 Aug 2025 16:46:39 +0000 (GMT)
Received: from [9.39.30.243] (unknown [9.39.30.243])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 11 Aug 2025 16:46:38 +0000 (GMT)
Message-ID: <f3ecce9f-22cf-48e2-843e-63f08a577e69@linux.ibm.com>
Date: Mon, 11 Aug 2025 22:16:38 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc/fsl/qbman: Use for_each_online_cpu() instead of
 for_each_cpu()
To: Fushuai Wang <wangfushuai@baidu.com>
Cc: frederic@kernel.org, christophe.leroy@csgroup.eu,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linuxppc-dev@lists.ozlabs.org
References: <20250811065216.3320-1-wangfushuai@baidu.com>
From: Shrikanth Hegde <sshegde@linux.ibm.com>
Content-Language: en-US
In-Reply-To: <20250811065216.3320-1-wangfushuai@baidu.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDEwNiBTYWx0ZWRfXzUjSuxKKKX8J
 NIaAIJsCrluSo5NbhwWQJ+X9uLkf919nigjMkco6BbFFc5a/uHZT8WzAC+py6gT6myDO/mgBYve
 +HVOAOr/0qvkXD66X2bNKuE5c4LzorK3dQrdvFz+ZXC/0UTx8CmLBk0dOWN1A/mJg/kEFqt5C2E
 ggZhjUhfdNwm4QjQXJ2M+6ysrhYzMelsLKVvVt50crY9g7uUKJ81EDEZn/lGr5yNdvtouZoDk0I
 wjLYwCHZ9WNXwrWu5a4C/3Vi5io9qe8jsxEykyGqG3v5eXfozxE81sgwoR08weXvGNWy/5noMk2
 d6ny8FdV7zbFkMT8OUNk3cEiMJsU6jw6gXpvoCCWE231RkZ3d0FcJPjowMA0LELm7lijW1kgr25
 T0XItL4i+K4UpQKRn0B2g8GyzubcCNPnRBaQxrcwdqaZft4uPn0oEcJxJ9naryoEdT63hryq
X-Proofpoint-GUID: TDgLOFCUzs6KSeu4QXexSOYJXoB8Jad6
X-Authority-Analysis: v=2.4 cv=C9zpyRP+ c=1 sm=1 tr=0 ts=689a1e73 cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=zuLzuavZAAAA:8 a=VATuJ96wsPKbvXY_zzoA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: TDgLOFCUzs6KSeu4QXexSOYJXoB8Jad6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-11_03,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 mlxlogscore=977 suspectscore=0 impostorscore=0 clxscore=1011 malwarescore=0
 spamscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2507300000
 definitions=main-2508110106
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_094656_940301_423E23B2 
X-CRM114-Status: GOOD (  17.54  )
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



On 8/11/25 12:22, Fushuai Wang wrote:
> Replace the opencoded for_each_cpu(cpu, cpu_online_mask) loop with the
> more readable and equivalent for_each_online_cpu(cpu) macro.
> 
> Signed-off-by: Fushuai Wang <wangfushuai@baidu.com>
> ---
>   drivers/soc/fsl/qbman/qman_test_stash.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/soc/fsl/qbman/qman_test_stash.c b/drivers/soc/fsl/qbman/qman_test_stash.c
> index f4d3c2146f4f..6f7597950aa3 100644
> --- a/drivers/soc/fsl/qbman/qman_test_stash.c
> +++ b/drivers/soc/fsl/qbman/qman_test_stash.c
> @@ -103,7 +103,7 @@ static int on_all_cpus(int (*fn)(void))
>   {
>   	int cpu;
>   
> -	for_each_cpu(cpu, cpu_online_mask) {
> +	for_each_online_cpu(cpu) {
>   		struct bstrap bstrap = {
>   			.fn = fn,
>   			.started = ATOMIC_INIT(0)

Yes. This change makes sense given that for_each_online_cpu expands into the same.

Why not do for the remaining ones too?

linux_tip$ grep -Rw "for_each_cpu" * | grep  cpu_online_mask
arch/riscv/kernel/unaligned_access_speed.c:     for_each_cpu(cpu, cpu_online_mask) {
arch/riscv/kernel/unaligned_access_speed.c:     for_each_cpu(cpu, cpu_online_mask) {
drivers/soc/fsl/qbman/qman_test_stash.c:        for_each_cpu(cpu, cpu_online_mask) {    ** current patch addresses this.
drivers/infiniband/hw/hfi1/sdma.c:      for_each_cpu(cpu, cpu_online_mask) {
drivers/cpuidle/cpuidle-tegra.c:        for_each_cpu(lcpu, cpu_online_mask) {
include/rv/da_monitor.h:        for_each_cpu(cpu, cpu_online_mask) {
kernel/trace/trace_osnoise.c:   for_each_cpu(cpu, cpu_online_mask) {
kernel/trace/trace_osnoise.c:   for_each_cpu(cpu, cpu_online_mask) {


Rest everyone seems to have moved.
linux_tip$ grep -Rw "for_each_online_cpu" * | wc
     416    1141   23047



