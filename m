Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B064DC9832A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Sep 2026 16:04:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=04CycRj95YLfmA7hA1DhHUf9OsDpKgTDD3cyHvnkUEc=; b=fnVbKpztY1zClP6BLXUMueyTWi
	BAxq+hP3ac4rQVt17rlQhCfRlwsiy0+mJN/A/MG/as/ZKdqe3rFU45WadDg/S1+YsifiGaVmJVl4N
	bBXis6E+GUBejmvPeaJhw6tTo86E5pJdGZz3KcgWGXLBMb9Hzh4Ff73ve7wVp43W45APNN+L3Nq5H
	M3ipH3u9lh71I/SpdUz1huzHNQUkpDTWroHkouD/Io7JythCvM7R0Ny8xdAQOcUEIK84II3mcGC9N
	hIBEVn3CnzamhruqHpISzO+VtFxmieyB1SbFRqH0xELU2oxFkWd1cMHIXKdzhm7AkUYxPjG1VqcBH
	2HjEswPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAUt3-0000000FdV1-26iU;
	Sat, 26 Sep 2026 16:04:29 +0000
Received: from mail-oo2-x0e.google.com ([2607:f8b0:4864:31::e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAUt1-0000000FdUd-2Azh
	for linux-arm-kernel@lists.infradead.org;
	Sat, 26 Sep 2026 16:04:28 +0000
Received: by mail-oo2-x0e.google.com with SMTP id 46e09a7af769-81b8e8e9cb0so18380a34.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 26 Sep 2026 09:04:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790438666; x=1791043466; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=04CycRj95YLfmA7hA1DhHUf9OsDpKgTDD3cyHvnkUEc=;
        b=SdhNmXy35+OVkd3vb+o19FWs/ieSbuf1HlBzR+QvZKSHgd8/R0LRUDkTdoP2iJV5Ax
         v4EcVXkipHW/4ofLY9XV1upqWUrWx662JwUA8KN3N3L/vHKqICjNf4Kcisa0TglCBXOY
         f52hD+XVoprWpuc1YVmbFdbP6+jtC9oewaxvKUmYKuhO3xs0xRWo9hbSNNFqO0Bo3P8G
         p/51KLQ/7gtxlh6k/Tf1rQvMbkv4LzVIMGdXfONmJTK0dasVz6dAtdfNzm9SZpXphEH+
         BkZ2r7HtW47CgV8Bcjumd+fuNy68ehmiIwhLFYL+xhhb54mAfoGe7ZrDmMaNQOni4Sro
         pYZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790438666; x=1791043466;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=04CycRj95YLfmA7hA1DhHUf9OsDpKgTDD3cyHvnkUEc=;
        b=LylQxpZcRXOIliq+2obES+6rHTNn1f9D54Ow24m+GsazHntJOlouq4pD+Y0wpYa5nO
         v2JjrjRVZsTCRhuPq31xFL+pLtblfcD2P5hMKbspnPuZ6KtBuAKeiWh5QJhYuWSmxi4D
         7nUpivh2stSevw4XNLkqcGcDEp5KQY2DJkhi0vdkjQC90aIV1sbrHCL/Y+XM5Gsr9kOW
         buXDjyXKwBsYELbZo5riT9uQkbWw7KZjMKIYcmtHN4hlqrFbMMici9v0/2U5tEmPrIXY
         9AcJp69Ufh7GBp7jiymYCfZEZWxXfXTLIn9T+24RyPYEylIsv3osDYTIPPL4FQpWoa5z
         M6ww==
X-Forwarded-Encrypted: i=1; AKwUvBz9JkuDoOfNSc2lFsQH01/2WbJMO06/l1UAt+i8D+b2W8KZhS/pmaqYJL5EWG5XhZym9JsDPf30UmqPPf9JQLpu@lists.infradead.org
X-Gm-Message-State: AFuF++mWMJ+QL/U4fztDyWDwtJA/IMprFQF+Z48TzgdSOT9nRQKQI4s8
	I35vw9JUlSq3fT5Q8Pot+bbDbLdOm2CbWJL+izT2Ry32fExn6Io1/YpI
X-Gm-Gg: AYBFou27zGmqQlTsV0eLVxeJCbpuwZhYA5edaUryXvpSm4j4+s2eZjk4cwkyb8JhZgZ
	7VYDiJL44wpyTuCvV4zHfnlEE20qojBuMUw+zgu6fVOAIzMY9AcoA5seqYWuX8TCQOYrpxdPncE
	OcmMbSO03umwBnDJupQ+ky9R+0+HRoBdvpoQkMZIPf8b9dmi0Vjj2OQbAPpsHH/AwTIsR0Iz+qL
	CXmuzj21bgLL+342aumcSAHTgBm/s0FC0ZuhfWQNqprY5G3uHCfk+vfKRm58Z1aqb7QsM9OyBtL
	bZYtAziFlMwEwCxYOigQ4OP38bImVny+rLvk+K+0Ec7qYbzpIsu9GbQT+pabp+Fc09aXBRueRu0
	p6DOOF2kudlhXyaTjDa/L7yOdb4MkASIF4Jvvo2/fu1WgDAGK1m+9MLirvwjBsi28FoPL7GQjgv
	ByVFjX9+qLE37mrWojLDbKMkYc44ojwPIDmNhIawY7R1FNaglVCWivw8XHa6qiZU50Ox5dkVNvI
	prIMvYqYh0TeoTAqc0QQRqXWUAj4akPBOAZgPhC331KTE6lJUwoplJ9Srp4vprQORQIqS6RonQl
	Jo/RTBGGs3TU9g==
X-Received: by 2002:a05:6820:4b08:b0:6b1:afc8:3162 with SMTP id 006d021491bc7-6d43f2c6fd5mr9089210eaf.7.1790438665895;
        Sat, 26 Sep 2026 09:04:25 -0700 (PDT)
Received: from fedora-laptop ([172.245.82.59])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6d581dc58dasm6182919eaf.4.2026.09.26.09.04.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 09:04:25 -0700 (PDT)
Date: Sat, 26 Sep 2026 11:04:14 -0500
From: Ming Lei <tom.leiming@gmail.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: io-uring@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, tglx@kernel.org, mingo@redhat.com,
	peterz@infradead.org
Subject: Re: [RFC PATCH 00/15] io_uring: thread identity handoff for blocking
 inline issue
Message-ID: <arfs_kX_gkH1o_S-@fedora-laptop>
References: <20260911154148.644489-1-axboe@kernel.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911154148.644489-1-axboe@kernel.dk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260926_090427_562849_E01AF62F 
X-CRM114-Status: GOOD (  13.28  )
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

On Fri, Sep 11, 2026 at 09:40:50AM -0600, Jens Axboe wrote:
> Hi,
>

...

> 
> This is obviously an RFC, in terms of what I'd love people to take a
> closer look at:
> 
> - The scheduler hook and the identity move itself, kernel/thread_handoff.c.
>   Is the set of refused states complete enough, and is moving
>   thread group leadership this way (the leader must stay first on
>   ->thread_head, like de_thread() keeps it) acceptable / kosher.
> - The x86 and arm64 register state handling. x86 refuses AMX users,
>   and arm64 refuses SME.
> - Whether anyone relies on a task's user identity staying on one
>   task_struct in ways not covered above in the series.

This way may break ublk server given 'task_struct *' can be changed because
the server issues blocking OP(fallocate, ...), then the `current` check in
ublk_dispatch_req() can be hit.

Also there is risk in 'task_struct *' keyed bpf task storage.

task_work queuing could become tricky too.


Thanks,
Ming

