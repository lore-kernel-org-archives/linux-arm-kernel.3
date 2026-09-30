Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE1E0CA5FC7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 16:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RJsMX2lmV5ZOu0OhhWQETYgs9bQFhObUxVjX+YGHGYY=; b=IQIxzDPB2LnJzGjnksQ1X1S+N6
	jdG5pldCcIoQUH8QCK2pHO8t5A2NBrpqO7PJvBL8G8SDiTE2EsE4lQYQK961ga6JtdS0hmBJjWCOk
	MFzI7ZjsIZUy7q4F8m3D6AJuYFli9OuwpJ31bDVn6G5kCkHjMTKAgefxuoSfMXmrPKXQLmJ8VydqS
	IWetwLxf2dsgzVNxLGn5RVOXtDU7DYlKRwJNWnIFhUJhdkpWHw6HCw9Hg0lA6PRXXid8u7HSbZUYu
	ZaehhYFI36uZSfKtF+0zWyYeucUg4fb2SyrdG9sQSanxErS2H46FeKGJZb++16jVobV9jNfs/QPUt
	7857r70g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBwpG-00000006dII-0d5J;
	Wed, 30 Sep 2026 16:06:34 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBwpD-00000006dHa-0wsf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 16:06:32 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UE04q33942334
	for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 16:06:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RJsMX2lmV5ZOu0OhhWQETYgs9bQFhObUxVjX+YGHGYY=; b=GrzS+zys6kCaaQuR
	hoYYKt3vxHvQAsVUc8sd7nR5DNlwNVQ/udeLha/y7PBdkrOan6v5ddR1cVm9uk4/
	QenhZMPEoE+sSrea/Xf7uz3u6zQZ+zmLeh8yOeFhXcYjex23pw7gf/YsduLeNbCN
	36DYaVdtCJXpvAp18lcvQWydfUe+3VFOhZ3fIt4dQjTqmVfwn+pRr4uBO9A9ajib
	Jn5mjjn2PImG2IOXGizFtK9L0rmR07DJB4QON5XZumW/LopQArDtELJI51GS+wKz
	eSCMFF5usimEHanL4mpYFl4PXD20XyLB+Sdv54i+20Pfb7rnXm/U2plXKUzH1a55
	zkI1Iw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h10bk9jhm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 16:06:29 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-34d62bb27a1so1229526eec.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 09:06:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790784388; x=1791389188; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=RJsMX2lmV5ZOu0OhhWQETYgs9bQFhObUxVjX+YGHGYY=;
        b=UFLXRlI7qPZ9X23T8qhPzbd7jQAEF3e4jRM2tJXKmf1mM7fofJ2uZ9xGEmljlgRxO3
         RX5BDK9WdX4CKDDLZT4mEhNru/Yu0LBU2gW8bRmn/sOiyL8m987kAoeu9EWScltYTfHC
         tn2O5VnbMqU59cvzuFUm2sMcf5a6snDfwl7AoHy8fIFsFpzPY7ztv1QoRd4fjgRY4qpC
         KPOO6ZmLNnvsg+UYtcVBzagAbU1nebqYHaOWFEyroK8iHfgdYccc3hD5BAOnRRc4iVmk
         vcXSH845bbKfpHSChF9eoBTMSo0dsWQC869eDo9CryA2aOJ3c58YwKH5kcSC5YPNWMCw
         GmQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790784388; x=1791389188;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RJsMX2lmV5ZOu0OhhWQETYgs9bQFhObUxVjX+YGHGYY=;
        b=rIWZW6k4fBxvbDnWUaUZWeWukjsr7hNPOrxMJ4UpCep5ieByIf4zGVRiyJpQs7Ugoq
         KE/rzH63eiw9YM5nbklXraWfaT9ev2C5YQABFkzSj8Qv424v7qdHLA33EuY3Rtt6n+j0
         UWLmXSzC/BdR7WM0refg9Qja87nOnPTmgI11NCGGUTNQ63B/m05GubAa2y52jMjKNVzQ
         pk5uM0fCxTnKummdpcN0ve3w7Sac8b/8AOWqFM3NKfOLctF3kA5U+Lj2IBPrJySI/A1R
         6dPF1Ix8w9j+TogtBImVE4l6nU5Qv1GFRGoTv0LtgKGRJnrtE0h4Wf+ZRpnif67R5km2
         ShHw==
X-Forwarded-Encrypted: i=1; AKwUvBz/EdWuOYAMGl88Hq1gOc9QmnRJm9cnchsVfkQB9j489PRGF8GUOMTdi/v5BwddKjNG7YVtH1Fog7Tf1n3t6DEc@lists.infradead.org
X-Gm-Message-State: AFq9FYIiBI3lEm3bmryUaKp5b+UycAjmbs5BDw/NVjrJltOe+vloxeUD
	t/F3CQgXGj55+xo+YZ5L9x21wy/86XCd+JPHksHHnqSY/SK4IpLZdWuajVXJKW1nd4pXzn6TX/H
	rR6F6nTLVYZO0OLy1TRWTUf2pvRGri4/7wunRjIBqVSgtvTvShcxYPqCABkpATShKzeAFzS08fC
	GkUQ==
X-Gm-Gg: AYBFou3xaRYw/ggSqkeyStVVBLSA/T1Se0phtGKsdYQrzZ0VGjiwSPjiX3jkTm4Xi7R
	UV3pKSMdRfcsECVESyZS88gqM2N1RrvN0s/N0eAo3Dv4WjKHAizXBz9kJ/FweEBfPK4xCuKTQMp
	7RFLIwpUqLppQlP+zrn8jox4RTDxTIikMVxLfQPobCQDRwmFKrCWkCwNeM5su+z+XwBnuuIw1bX
	DFMLz71bVOedKMDZGXiICkTAFBIpVoA276wT2ynGHnbWkLp99U73R1D436n4ayveowR/sC+Bnd8
	fP+RDmKMu4qa4vg1eG45zLShBhTkLDZ2INJt0fZWfQR+RRypQYk/ss4hVzQnnzvGi4LdpFHdeBM
	wZwVCUD3JVQqP8NSDrlWVDlN2CBZWBROP3Ps7IN4INV+6+Hb7akf9Ag==
X-Received: by 2002:a05:7300:f791:b0:34c:5283:4f07 with SMTP id 5a478bee46e88-34cdd792968mr2177200eec.38.1790784388275;
        Wed, 30 Sep 2026 09:06:28 -0700 (PDT)
X-Received: by 2002:a05:7300:f791:b0:34c:5283:4f07 with SMTP id 5a478bee46e88-34cdd792968mr2177166eec.38.1790784387688;
        Wed, 30 Sep 2026 09:06:27 -0700 (PDT)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34db0c8e76esm167595eec.4.2026.09.30.09.06.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 09:06:27 -0700 (PDT)
Date: Wed, 30 Sep 2026 09:06:22 -0700
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, maz@kernel.org,
        will@kernel.org, catalin.marinas@arm.com, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, steven.price@arm.com,
        aneesh.kumar@kernel.org, oupton@kernel.org, gshan@redhat.com,
        joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
        linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
        sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
        WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com,
        sudeep.holla@arm.com
Subject: Re: [PATCH v20 7/9] arm64: Block hibernate and kexec while RMM is
 active
Message-ID: <20260930090622.00006590@oss.qualcomm.com>
In-Reply-To: <20260929221623.1342076-8-suzuki.poulose@arm.com>
References: <20260929221623.1342076-1-suzuki.poulose@arm.com>
	<20260929221623.1342076-8-suzuki.poulose@arm.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: be-fXNMu7o53kEQKdhod5u_UaW5151wN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA2NCBTYWx0ZWRfXz2E39OISvDRK
 b/uhSUSbfKb5AEk70aSxFJKeeD9VLTbnq55Ts+HWO0dEEb0x5iHe5Ps5ctoFj1U0gnoCJpfYvQG
 Vu3I8SC6Hn3+4YP7WXSwa/GSAuyISVZLn+3eM51nrQhIlG82H3mbUG3AgVE33f4tV7FKT7xhXjW
 bcX9X9H2elMPIDhbVbjpY39p8s3mmpvyrgj7aZFCAM488IlJHhdbu3hxWwnBbyu1a0YYS+3GKFl
 VXGw93E1JgSTfy8oe0AENrUCyCamxIhbnLSo+qhTB7oYMsUr+biC3o6SSLTkaKF+ccicqMT6vvz
 EAeJ4L84qqazeCTMg7gRFyOEK80X+jjReFQ5/2wdVEmZcQ4ZW7g+lL/cMY4jsmA5JnI9dQC7XH0
 ibpkl86VeZWmjesRoiYawdhAtkBSu+3SK2RQlr+EdVzFH568FaKCRdpM5jf0jxk8EVyc0bIt8i1
 +e3hO5b52498zu12EaQ==
X-Authority-Analysis: v=2.4 cv=MZn5KJ/f c=1 sm=1 tr=0 ts=6abd3385 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=LZvgd7wXd7bcPLl1K1UA:9 a=CjuIK1q_8ugA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA2NCBTYWx0ZWRfXyDl+kFMobSzi
 PSB4YicfTzBdOUSWqzVfV9B1Zm/kosEemYhiDx/8JiGSetOKpITkhn44a1VtJfHh/HWAVoq1J0G
 LjvzxGsh0y7566XOUat7wVb8f4Koe8w=
X-Proofpoint-ORIG-GUID: be-fXNMu7o53kEQKdhod5u_UaW5151wN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 impostorscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609300064
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_090631_414535_90B4D56E 
X-CRM114-Status: GOOD (  17.17  )
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

On Tue, 29 Sep 2026 23:16:21 +0100
Suzuki K Poulose <suzuki.poulose@arm.com> wrote:

> RMM can be deactivated only after all delegated granules have been
> reclaimed. If a new kernel is entered while any granules remain in the
> Realm PAS, accesses to that memory can raise a Granule Protection Fault
> and be fatal to the new kernel.
> 
> Crash kexec/kdump needs separate handling. It can be supported only once
> the crash kernel can tolerate delegated memory inherited from the primary
> kernel. i.e., be able to read the pages safely and fixup the GPF. Until
> then disable the kexec completely.
> 
> Hibernate has a similar problem. The image cannot be safely saved for
> delegated pages, as the RMM doesn't support exporting the pages.
> 
> Disable both kexec and hiberation while the RMM is active.
> 
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
Not my area of expertise but follows similar patterns to blocking these
for other reasons.

Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>

