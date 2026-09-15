Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F556C88E77
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 22:21:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hnJAniUUz5UpK0eAzqlFlmnyP+PG3E6KxIttKsrRd1w=; b=DACWjKu7aatftj
	RpnN9AbJl1SDk+f84e3nn51FQ6YM6RCNZQy5D4dXd2lvilYc3Tb0ERTyYWZEViQPj19rGbPDsVDvH
	4GBMJO7K1zDrDQbYrVowYscCpV/7jUQaSYAWvPOjZfbTknlEga1+TSMTfxXrCtTijBsc+eC0RS7fj
	DfV+xGsqhKcI77wQYLIfARanFRZdSsRq+jjnDQ+pYbj7tpTBcuqPg+LSxaUlqTR+b43/W1JSFljVJ
	sBfd9NtHUa4/n/VqwipsE9Oa/gGqpjP49MSIf1PmE0iTdRunGp1lI+Q8uJkb2vWKOOj7sBglxMGqy
	3gfpJOOQQwpckVGqDNGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6bX6-0000000804g-0Qpg;
	Tue, 15 Sep 2026 22:21:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6bX4-00000008048-2GQI
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 15 Sep 2026 22:21:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:Reply-To:In-Reply-To:References:
	MIME-Version:Sender:Content-ID:Content-Description;
	bh=hnJAniUUz5UpK0eAzqlFlmnyP+PG3E6KxIttKsrRd1w=; b=c/ybMo+L34M57u9pSeT8wJb/c5
	TARKvru6HDBqJIkV+FstRpkMbpr+s86XiXuFIjFWhA1aUXDZLbUA3aeW82k7zNivmoLMcJDTf3D4l
	wx71NrmRgGopjKrVSXfqrhrFGR/RoEU1Ku00v2jfy/J3DzjnoE3V7zgqLok6ft4kxpqAfgYBSDOlk
	9QRqJdzjHUgaZh/syjsZWUVfrbXDQy+DZh26Vu8jIxVY48LSmd/W9CY3siJ6ncXSXY+JcD8hvUEDn
	EAY73/gEeNmB65pfE5NPZR5lw33WFeSsJJlC9t/lwrhVnxIZLcqd6vIjo5izCjmcWke6KLkeeCxJp
	UHAl/1Mw==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6bWz-00000007I8j-17bp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 22:21:41 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FLYkC2721224
	for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Sep 2026 22:21:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=hnJAniUUz5UpK0eAzqlFlmnyP+PG3E6KxIttKsrRd1w=; b=IV
	/k2TQjkUrsTGpshqW8f1AkLpzgE6WqJLnJXyVNHKYz8mozA+vLQbIOpShvI99Nvk
	BGk11nj45xZQZMebNdo7NiYw/EO7W5wcvHVc8eAkRKtGrNMclkKkbe3unomYvdUd
	vFaT1byqggr1zubtRjDzuTG9pECEQdOzFAiv4kdIU3d7CXM0IsQ27dhrP8NvQBkU
	TlOdMgPnM8h4FF25SXM2n03VFD94RLvjnLlaGSHHxie20ptztZeSDX3B4EelrzMT
	n1DLEJiB1mKEp0dVH3Si7JCiMZpC8ZcIigaByfbQDV2F2ANWVcL1rru5kNRyAlZ9
	ag1DWjYpUlLQQuGalXdA==
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com [209.85.160.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqah9s4m7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Sep 2026 22:21:31 +0000 (GMT)
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-46524220c5aso5637305fac.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Sep 2026 15:21:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789510891; cv=none;
        d=google.com; s=arc-20260327;
        b=FxvJkK2FEXSe/nziJjGNKk5bLYrVf/5NSn5smbILB6Oojmh3g8Hu/z2Be5WD8ow2f7
         zuNpnNgMeGfu0kOAd6OFeJgLKob7rz1Tab9x5gHocUgbxlDNlKi8gepBIMX3SMyLlo8J
         r3aL24cXdlatPkVv5nLYqF3FAEWWG+D98yLSHZnlAIykGXoI578QaYP8M66YYF8lT2On
         iINUcfdVs7NMwIszeObqsoBmEi0UNf9w0MP+y5XK9MV212g0XDSl4S9wxT+98WGJEE7z
         btH3YBz5qZPYSpOCdY0eFvKHcfgdqA7QBKVzrbWoXvRU+pq3ekYEfjA760TyDD4NoR98
         PUJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=hnJAniUUz5UpK0eAzqlFlmnyP+PG3E6KxIttKsrRd1w=;
        fh=WS6eyDsAUYJNRpe5noBpnWmaWUqQN2UDqrONtNTz+AU=;
        b=VWbB1jFvIykrr1jdhyP/Iv5VTJ68T3sqeAKsFIeUschob4nXs6wjXqtYatRU0Z0HkZ
         v4fxXAvWpbIRL4223RHBb1ibskAeXmHn+4oJpuib08EsoApjduDNr/wGx5XrJh8OXOQ/
         fCQtM6sPBn0yjGPIejSHp/bFNxEXXuDEn5D6kpnTYsS2ZYpYOFXA4XqlirjJ+EVh1VBg
         KP2aENqUNP998ZSCSo5nPH+gRVT9gQiTmzcbJ5AuVRyFpvSSqY3vKLVk9MS4n4KDwkFs
         FVs0qb/1oVJk8ZZUcbkvX82tp7igfR7roQkf3omCTkD+gobOvQK7am/O1xYh9E40sQjH
         DFfQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789510891; x=1790115691; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hnJAniUUz5UpK0eAzqlFlmnyP+PG3E6KxIttKsrRd1w=;
        b=FoTYuFy9GrqqNPcs1ZFGImcDmRL5AF9tq00ISMZkXgyjMZso2cbXZu+IbhHuJEU0BS
         VWv/pOAett/QhTdHkSetFnVbD/ogWtyJKXz5277/WTmhKGdLtFY0HcChI704vPTlMNDr
         02xytw1UeSFN0BKquJSAR4ejrsJUyRfI4KIqytyIdzxV1H8h8VtTx9mlIZrOslCPyzj4
         vjeAgEZdkOzDEdReEGEYOZn+0ldFnOsa2SZdaNXUzMaTX9OjXgy8c1NLh6Jvs0vojiuC
         g+pWBU5OW7qvWZoeP0CfWock+ACnTw0fy4IMEsaT9qYGaG1p7uUXs4dgoI3E5AiBuPoh
         r50w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789510891; x=1790115691;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hnJAniUUz5UpK0eAzqlFlmnyP+PG3E6KxIttKsrRd1w=;
        b=JwlD4wfiKqi+XgzSxx85gm6C9Izt+R/pYPmN/eWCv20bgUBctjNwWrOgY0IeiA+AhK
         8zFpes3/j2/+JnHijp7mIdqGgmEgHigf06UDMJ3NpNjedHOWPlhzWsqx8so7+IXlqes2
         /Mgoo6ChvlKMBJd1aaP4vcebiYUAtUVZuYJcbb2phXlYedmZTGL9xOTz4vIc48hlO4MF
         By6R/e6rc1hwz3emDV0FGdgpOldTE1dA/iqxyEjM7LkYBp5dvsEeSqdRF7J8elvBX/lU
         9oNIDdovsKLw9KQZQVfyWbpaL32MlM/HT6D/ccTwklLDKwKyQTuCXEjgrLUauuSSktfj
         M6ZA==
X-Forwarded-Encrypted: i=1; AKwUvBxfwwJ9xb2f9fQi4u/EjTdQtaeDLCpwOaXjw7B0fKn+aYliH0Ze4nqeLOpcOFliYm/cF+d73UIAUXWBfCu2KrSf@lists.infradead.org
X-Gm-Message-State: AFuF++n35s4nGopU6GbkBLg/sD+p7ApmNkvRR0sDxwiGErx+RwAUwbXW
	Y0eGmEuD3qYPlu3x+VpJNZf7rX0UgMkvmZB0FXOoKQRtGHTCkxmPIb9QxCY9YFSH4La4D+YqaLn
	WE/YZ2K5knhOza/b1JbzCalb8UE+VdciiDxWriItzjE9h+B3N9m6UnQVJOUHobToOXcJJHU7U48
	ga6W5mKrspeRYcM0GDxT4b53YtkxuN1E4QUfhIJ1NSK8ZHT2ohzL91
X-Gm-Gg: AYBFou0su0hb3te+Fqqo6nzQv5OdXWURVts32cXnnt5hrGeG7JJTZ3FehN999bn6El9
	Ar3PyhOsWx8Rdb7jlFh/ssmNuOoETdpSn3TBsFiRlcNTYjxAE++FmbginA38gS553f+1wCJpDCw
	+c63eAfjFAO6fhdlihmoDVlu7YklqhawDqL4idE7pU7DazApGzU4Bcluci
X-Received: by 2002:a05:6870:30f:b0:45e:2de4:95f1 with SMTP id 586e51a60fabf-4847584c51dmr189761fac.2.1789510890852;
        Tue, 15 Sep 2026 15:21:30 -0700 (PDT)
X-Received: by 2002:a05:6870:30f:b0:45e:2de4:95f1 with SMTP id
 586e51a60fabf-4847584c51dmr189724fac.2.1789510890430; Tue, 15 Sep 2026
 15:21:30 -0700 (PDT)
MIME-Version: 1.0
References: <20260915-work-fd-reserve-unify-folded-v1-0-4d5217d6b246@kernel.org>
 <CAHk-=wjeamU=_RYT9cR3dZJ2N-Teo-N1+aYh7jwhrB=iWXD0cg@mail.gmail.com>
In-Reply-To: <CAHk-=wjeamU=_RYT9cR3dZJ2N-Teo-N1+aYh7jwhrB=iWXD0cg@mail.gmail.com>
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 15:21:18 -0700
X-Gm-Features: AcwNN1UxxSxAxz0XPK7niSod0Tx_HsUs-C3mKdcqDSaFkh659BGkCorPygYZGHE
Message-ID: <CACSVV028AdnTYa6OKDeoJYCau58uTkKMgEdqTn7crNSV8QZxOA@mail.gmail.com>
Subject: Re: [PATCH RFC POC 00/50] file: handle files on syscall exit
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Christian Brauner <brauner@kernel.org>,
        Alexander Viro <viro@zeniv.linux.org.uk>, Jann Horn <jannh@google.com>,
        Jan Kara <jack@suse.cz>, Ingo Molnar <mingo@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>, linux-fsdevel@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        Oleg Nesterov <oleg@redhat.com>, linux-alpha@vger.kernel.org,
        linux-snps-arc@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
        linux-hexagon@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
        linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org,
        linux-parisc@vger.kernel.org, linux-sh@vger.kernel.org,
        sparclinux@vger.kernel.org, linux-um@lists.infradead.org,
        Jens Axboe <axboe@kernel.dk>, io-uring@vger.kernel.org,
        netdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, bpf@vger.kernel.org,
        David Airlie <airlied@redhat.com>, virtualization@lists.linux.dev,
        kvm@vger.kernel.org, kexec@lists.infradead.org,
        linux-hyperv@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=BtkIUoX5 c=1 sm=1 tr=0 ts=6aa9c4eb cx=c_pps
 a=Z3eh007fzM5o9awBa1HkYQ==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=Z4Rwk6OoAAAA:8 a=VwQbUJbxAAAA:8
 a=2Rxv5svHm-zNKBYa0PsA:9 a=QEXdDO2ut3YA:10 a=eBU8X_Hb5SQ8N-bgNfv4:22
 a=HkZW87K1Qel5hWWM3VKY:22
X-Proofpoint-ORIG-GUID: UcUDE-wZ3NFv9sLN0aLqs9rSx_DcwChz
X-Proofpoint-GUID: UcUDE-wZ3NFv9sLN0aLqs9rSx_DcwChz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDMyNiBTYWx0ZWRfX2uvKTGmpV7rk
 qsfM0GVBKi1AW945OnHWiPZ0bMXCIumSSRJbTQRoSIbfo8cjde1Wxcrvnzr7DjM6hnzyDNw8Cct
 JHeQiDx4iDj2D01MIgyE3CisgOYBSiSGlmR0GJCTNnoX5Z7S76x4vR8UInw7EOkRndhi8wf9xKA
 xBDXIoMMb5b2rnR0xs7a6QQtQTKkpccYhLmbO3ivmODuLcb1WSIE79DMGDnwfZfKnuBbi5zn1n1
 4lkA444o2KhDqCtQZgUgkGttd4R9D4mnp2cWcsvSoRwD/sJZ0Hc0HjEeo5/VCnJrnlT0OiZSjDi
 0zxSo4FXJO4XDOuCmuTLuIwEMuuEGcNGueUyCHlIhMY4/fjxjfcoEeI/+J9MgHEfeRPeNznRQy0
 ggv8zUvXysI5Cz84mBryEXZzMutoEQTLm0s2EoeVDkbM01MBEGzqvovYqdgqu1Xz4335bRtrMMe
 tuoTvuamEeuRrQJMyMQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDMyNiBTYWx0ZWRfX+8DY3YTHSmS6
 UZIG9e+56fH/d/2FcTxTdAiPkiV1mgoaMD4VQyiIoW6IFj9RgzLkyQYz/8EzOnXHwZNKqD3Qbot
 gIrrrUeV5fGHN3veX4BVQWn7u6G2N1c=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 spamscore=0 adultscore=0 malwarescore=0
 impostorscore=0 bulkscore=0 clxscore=1011 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150326
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_232138_197727_D801685B 
X-CRM114-Status: GOOD (  21.70  )
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
Reply-To: rob.clark@oss.qualcomm.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Tue, Sep 15, 2026 at 9:02=E2=80=AFAM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Tue, 15 Sept 2026 at 04:31, Christian Brauner <brauner@kernel.org> wro=
te:
> >
> > TL;DR, this lets arch code handle fd install and cleanup. fd_prepare()
> > allocates a descriptor like get_unused_fd_flags() does and records it i=
n
> > a slot on the task. fd_stage() attaches the file to that slot and
> > returns the number.
>
> Honestly, I am *not* a fan. At all.
>
> I think this adds complexity rather than removing it.
>
> The diffstat tells a story:
>
> >  106 files changed, 962 insertions(+), 861 deletions(-)
>
> in how this adds a hundred lines more than it deletes.
>
> But to make things worse, it adds them in bad places: low-level
> architecture assembly code.
>
> Those extra lines are *not* making complicated code simpler. Quite the
> reverse. They are taking fairly straightforward "just deal with errors
> with normal cleanup in the place where it makes sense" and makes the
> *straightforward* case simpler, while making the big picture more
> complicated and subtle, and adding new code to places that are not
> simple and just blindly do somethign that makes no sense in that
> context.

With fd's it is more than just about error rollback.. exposing an fd
to userspace mid-way thru an ioctl is an easy security bug to write..

OTOH, "just use FD_PREPARE() / fd_publish()"..

BR,
-R

