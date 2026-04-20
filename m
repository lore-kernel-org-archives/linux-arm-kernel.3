Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 238C1F36C2A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Apr 2026 07:06:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GeJ6fpnU969i6/hRfUoKXDZEOqk6TsNNPMvVeYit3yA=; b=VrK8bs5DLAfKgu
	lDM34e5V9Q6nu+gfnifXuyvElHGttN6VIL9IHyvCf3KlnYz0k7fZy+PYmuoEopLERLIDWgQy7jLcF
	pRFBCBO1/FOs3IlvqkxiAzkcl0kl4ZtIa9XgfZEWYG5RHjIrJeLRe44SAlZ4yx9ZOot33Jg9BKawQ
	2frC4BIKuSmPkOkdVYA38Kog6ttk7aurPtxEuXs0GN1gnUZAXFXEp21+QO+A16ElkVBXcuYhR4m2x
	D/US2om5yPEfrbcltqleuZnoiLusVnEDvsQuUrDVSgVYhpmuwsDyN8DfJGTQfQ9jkjh8++iQf3uL2
	BMtxwsZCIL9IAoxwSOiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEihs-00000006X1Y-3hFV;
	Mon, 20 Apr 2026 07:06:08 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEihn-00000006X0J-3QuJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Apr 2026 07:06:07 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63K4RnBP915482
	for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Apr 2026 07:05:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=GeJ6fpnU969
	i6/hRfUoKXDZEOqk6TsNNPMvVeYit3yA=; b=eKWnXsIt6aab9IgZjzG1PRrEM5M
	9UL7nrrqMsm/z0o24MzL6sR6D7XNVZzUexVXulQcwDMgIpXZ73l6NXZcc2pElH4u
	TpstcQrf7W60wGSdmdJznejNXVpMN1vER8IFK89lUwzxWAj1OBVUgGaHWYTXtqjR
	icnVtROKVgqUBxf6U7dquVjFkSxYYi3zZt9g4NhiFzLF14Ug5xYP4fM0syObP+zh
	x7qAqlZlDREflksgbZf8dU2jlRLEkalcKO6b5b5PZhf8jPxnZqXwKrVqsRlI/bgH
	jwZKEGrilZT1fJNAIlfIy3jl6KeTq0f4XuV0C3xqLGhNF3xFyKwl0OQBfAQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dm21umj5q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Apr 2026 07:05:59 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82f70ae35c0so1309554b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Apr 2026 00:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776668759; x=1777273559; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GeJ6fpnU969i6/hRfUoKXDZEOqk6TsNNPMvVeYit3yA=;
        b=OZQUGzac7OSbVQgj0VSnt3q7m7rgerHJfAnBauSnjmjd9/c6oVQ8qbT6c4qFW2zVYH
         XFWLxjqnvI0flhXbp3r9tluTSqc57ZdPAvAQKB5VedsKEHLFeijgxqF1jnjcnPWe3t8Q
         esYzzOfk4TIdcXP3lFm1hMJHOKFgm+NXQlwmtIvpp4FPKDklOFjjtXMATmL/SxjS6Sn3
         HUm9O0+GGh9Hcp8WI3TIJLmu6vatIXSNM+m7p6hV1ftn9CU0ul1sA7gUIiLr0vMVImhG
         q5h4IUkGMDXvwPSVCHYfehTF5FDB7zwmryakZIg0edxy64vocZO+6ZkWAY+PGw45BTsb
         YqwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776668759; x=1777273559;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GeJ6fpnU969i6/hRfUoKXDZEOqk6TsNNPMvVeYit3yA=;
        b=G1VAMGdB1IYyGFa03Bf1bLasvZJlrd7Jbwq5Tck/NXZVwvA/ohFiN4utKy12AV+XOE
         39HGvzNXzHbwEp1/gP9oCnZ4xm5flSUfbMVvWBEVz0hL+xeDWB9LZ8y4q6zKdlKmO2o2
         /FaNPWW9j2K/Mnomjjf4eE90y0Olye8q+uCZRPUi9KH9dXiICGUdCdj7bFZOcaUSfT+7
         qRNeT73Azjql9O8Bus7/DBLFmGKoufRCN/V4E8L2BdAj8BLFk5qfU/8QLwlIoFfDbj5j
         9t7O+uXQS3cN11S0dn2BQd3EaOYep5IDx5y3YYd5VTa7b0r9+4+r2vuhHxmsj5lYfRPY
         gQPA==
X-Forwarded-Encrypted: i=1; AFNElJ+2SYql/u021Qig0tYoEDjITMaXLb2gV2JD5Psag2AjRnvTn5pNgCm/QstKRnnVOQO7+9oYfI7orfdLSKYRGqtn@lists.infradead.org
X-Gm-Message-State: AOJu0Yyw5HKyuNPjP3Q9Pjg/mmkuOL8c8+8lZQ2S16947GtIOHYLF62l
	pW12NLeAZM8vixA9/aQZXNfzO6ygeUSzzpI81q5SDzbWpWxpPU42AK14HKySu8KjZ28Kxc9yzi7
	NtVavMsZcKTwETO5ewqZUulz0t0l/P5r6Eqi+RPRbOe40mQl9rjQFqhcfrwYJP7uyYzTMD9/qcf
	1bNQ==
X-Gm-Gg: AeBDiestS/TS6313GBoSeckO03fCCSNCM65Gjmlrg3Rv8XzFM6wjpQPyKDT8ZQsp3xD
	ncLi94UH6kNZfoomEjPdQ4sR34deKw4/extuEadBEdzVaObd2MwFWMDrJZnkzBz+QzDyR3ujdAt
	Tllh18q8tK0NM/oYVq63ZNl4Lt3/rzQrTt0kKfJKEO7r2+c0dh1Gtvhqux0WmmxLf8985Uh+Num
	DicqCYSVTaaA5421dM+LFkt2Wv2Lfz+EI56xJHN1bbKaNjiatMPfWNYOagWHFYhMCo3ueplG0Gu
	Id0dKYJvUOzPtBiQ/5t+8Br7NeDX2+pkP+8QTwoQgsGKVbZT5aI64z7md6wkG7XuPo/ZaGpcd9f
	pNsscOJQsmCY/Ppp3A22YJGjmXGgjTjwjV05E+bkPW7AMSP8+36CMgvyTDbGqfzM=
X-Received: by 2002:a05:6a00:908a:b0:81f:9b4c:81c0 with SMTP id d2e1a72fcca58-82f8c90c380mr13948909b3a.41.1776668758662;
        Mon, 20 Apr 2026 00:05:58 -0700 (PDT)
X-Received: by 2002:a05:6a00:908a:b0:81f:9b4c:81c0 with SMTP id d2e1a72fcca58-82f8c90c380mr13948884b3a.41.1776668758194;
        Mon, 20 Apr 2026 00:05:58 -0700 (PDT)
Received: from hu-kshaikkh-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8e9fcea9sm11751925b3a.23.2026.04.20.00.05.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 00:05:57 -0700 (PDT)
From: Khaja Hussain Shaik Khaji <khaja.khaji@oss.qualcomm.com>
To: mark.rutland@arm.com
Subject: Re: [PATCH v3 1/1] kernel: kprobes: fix cur_kprobe corruption during re-entrant kprobe_busy_begin() calls
Date: Mon, 20 Apr 2026 12:35:52 +0530
Message-Id: <20260420070552.1747992-1-khaja.khaji@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <aaWS20g-jGu8mCKH@J2N7QTR9R3>
References: <aaWS20g-jGu8mCKH@J2N7QTR9R3>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDA2OCBTYWx0ZWRfX/fbwVEIeyz2D
 n7aKO2NvPPO2MxLJRRtCWSKMG83Xxl7TfUWzQjxQizLzfpPmsJAuujocQXj/aMblQzdaWbgM9tu
 be9ltHdN/ahzoJ5yV5rV+8g8hIf+R2t4H+0Qi/5GhFip0NYldwc6EqaVO1QNwY93dVUxQzbCbnq
 ODEDTq4H+Z6HkcIWDkXAo177vyDWvVxnaS7XbELfb3yt459UqzdnuRropnj4YT0jlh6HIDWiygU
 HqCz/RrD1zabE1w3PcFqhI6+B3Ys3yI+3ipT/9EhIxDW2qJZ6F3enP3EZWOhF5hW7CvvXYG8Zov
 EM9VC+r1knhSUq1njopHE2SrtaeTrrppUkziC1VE43TNngrPTzIOwZo9MlhmBYO3yRvcsBVY/h5
 UogiJmXtPAf257zt5fsRQhbi7tI8qKanvLvBwDCfl0pjY3m3Jn/WTFYeSH2CiJuJpWTqFrcoxus
 Upz/6NElW4CVKJWmfsA==
X-Proofpoint-GUID: X4ehzheSep0zWPAKCSZkoDdLJWLqyR1y
X-Proofpoint-ORIG-GUID: X4ehzheSep0zWPAKCSZkoDdLJWLqyR1y
X-Authority-Analysis: v=2.4 cv=WK1PmHsR c=1 sm=1 tr=0 ts=69e5d057 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=CdHHS4RwY1IrjTjwd6gA:9
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_01,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 spamscore=0 malwarescore=0 bulkscore=0
 suspectscore=0 phishscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604200068
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_000606_475660_3B963D29 
X-CRM114-Status: GOOD (  17.49  )
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
Cc: catalin.marinas@arm.com, dev.jain@arm.com, linux-kernel@vger.kernel.org, mhiramat@kernel.org, linux-arm-msm@vger.kernel.org, will@kernel.org, linux-arm-kernel@lists.infradead.org, yang@os.amperecomputing.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Mon, Mar 02, 2026 at 01:38:35PM +0000, Mark Rutland wrote:
> That suggests that something is going wrong *within* your entry handler
> that causes IRQs to be unmasked unexpectedly.
>
> Please can we find out *exactly* where IRQs get unmasked for the first
> time?

Thanks for the pointer -- that was the right direction to look.

You are correct. I confirmed that arm64_enter_el1_dbg() does NOT re-enable
IRQs; it only manages lockdep and context-tracking state. The IRQ unmask
originates entirely within our kretprobe entry_handler itself.

The exact call chain is:

pre_handler_kretprobe()
  entry_dwc3_gadget_pullup()          <- kretprobe entry_handler
    dwc3_msm_notify_event()
      _raw_spin_unlock_irq()          <- first IRQ unmask (spin_unlock_irq)

dwc3_msm_notify_event() is called from within the entry_handler while
holding a spinlock acquired with spin_lock_irq() (i.e. IRQs were disabled
on lock, and re-enabled unconditionally on unlock via spin_unlock_irq /
_raw_spin_unlock_irq). This is the first point at which IRQs become
unmasked.

From that point, a hardware IRQ fires, softirq processing runs, and
kprobe_flush_task() -> kprobe_busy_begin()/end() is invoked while the
kretprobe entry_handler is still on the stack -- triggering the cur_kprobe
corruption described in the patch.

Regarding documentation: the kprobes documentation in
Documentation/trace/kprobes.rst (section "Kretprobe entry-handler") does
not mention any restriction on enabling IRQs within an entry_handler. The
only constraint documented is:

  "Probe handlers are run with preemption disabled or interrupt disabled,
   which depends on the architecture and optimization state."

This is stated for kprobe/kretprobe handlers in general, but there is no
explicit warning that an entry_handler must not re-enable IRQs for arm64.
Given that entry_handlers are user-supplied callbacks, a note
here would help future users avoid this class of bug.

As for the fix itself: we plan to carry this as a downstream patch for our
platform. We are not planning to push it upstream at this time.

Thanks again for the detailed review.

Khaja

