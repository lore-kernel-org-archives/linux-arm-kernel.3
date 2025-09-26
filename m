Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A3E3CAC5AE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Sep 2025 10:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=miMbC+wFOoOlKiV7MAf6dHd1ZDQUknKrGY0xfQXgt9Q=; b=rjFOoddWxB7aNhsa/hvHyTLRo0
	Y9iiViu30cer5CsUouqNU0wUH7NNzJrhHAlaJFC9HeSgIi7Kwolqmd3hhgRkf5H8iDFgYpdkUYH4d
	sbvvDDszagVx5d/XzK2VdSp6ayVag1ub06n7V7lA628s3neHbgH8MegzbInUgkHAeiYDh2Q+5tiU/
	QJvvFzl6aj6BKjkdsjAmZL8wNLj2wYg60jr0jagifoFsWND1BBGvzi2O+c3v+cW5OgUijzIPbFouW
	S0CU8UN4NTVAoRRYN3LLutA8zVPSwRWnkKpAhkNKL0tuQeRLDnxYxgLCehAVQqK9f4/Crnmggk016
	0HyJF2gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v25Kf-00000000Ea1-0QWh;
	Fri, 26 Sep 2025 10:05:41 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v25Kc-00000000EYX-2KAk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Sep 2025 10:05:40 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-329a41dc2ebso1558278a91.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Sep 2025 03:05:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758881137; x=1759485937; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=miMbC+wFOoOlKiV7MAf6dHd1ZDQUknKrGY0xfQXgt9Q=;
        b=WAGtVSv/BI6OnnJ16dYENfdJLWp5XYtbCgC2gAf8+ySzIG83a4smEAxN14JDh2zHdn
         bj/4QippYuWpcxxuXq0jftRSlKuVMIv3OiDyU7wlI+23a0EteSWo8goGDSC1UP7QuXnx
         us8Bmv1k5bgava7S838SHVLQ7hu7tVCseZdW+XnMrAVwVW6auoOBdI2fqnh8QWEaOKC4
         kjkpYSANP7aN0SUwTe0ZiE6PKwHJ2/x9RnhUlsDDdzY0lGGj5vNPo32yJyv5WEovhKG2
         yoNhNMbZ/SBWE1G0RrJe6Tpfrs41vNvl/dPd027L6vQxZB6ZJyKbGNYzKFLbaloR7rI2
         0yyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758881137; x=1759485937;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=miMbC+wFOoOlKiV7MAf6dHd1ZDQUknKrGY0xfQXgt9Q=;
        b=Eyxn5yY+QKYaZpZfbwHqV+rE5amHBsZEiiOGB2D7897Fzq+UHoIXU7+zq4IvYvdHjQ
         QB/nUBRya3/9dUcxlI5FsRDb0HO1J3SqWjvFCVFR3pwpRc6mrfQqYJiMuGOS2CDxYI7L
         ol4zQxyGXsJ4hKNcDIA/KsmJPL9yGWvcMYPFE/Zl+KhpA9ZdJzUJN8Bw4213i9kIe0Y8
         WjtuIxlvXgE+L3f8jVaE7bI0FqXS3/jJPJlVBtOvS8VRbRxCwLJBp37f5+i7q/dL0W1p
         Fu/eRO5IWU45/i1Gs+ek6uC+qmmvwMTYaXAaegn8ojF/hCHvDT8x4/J+SCdvBvq1Pbr5
         0hag==
X-Forwarded-Encrypted: i=1; AJvYcCUEfWq6jM8XrSwOKzCDL6N8fI8d0T5y4ua7tGqA2MSPqwS+lKjWeAcmZ1mwZSWtivMJG1K/eB7ljYtT5VwVFxC0@lists.infradead.org
X-Gm-Message-State: AOJu0Ywbz7s1pvlfRubJrvVXWSyIuDx76TWi58ATuesnCzYXWn2rcyib
	zVDDAviVAeUBdhkY9RnJAwZ9AvnfenbrBbUv0WJNIxtYExYfh0s5qd6eGsJoYvZs3ZFvQ+yNY/n
	0iFrRg3ihOV4+oXidmu3FZ9xBvBnEyuIWFMSNZXDFgw==
X-Gm-Gg: ASbGncuKdKb+/uUHOTHXcz6M235CuqaY7ON7z1XASksqdkHf6AvcFMwxxsCzx5cRPud
	yIXny6uChZf3KjA4ydcGfdRHsWL6QIiRoVQeTJGYR3HQEPO/Uya71IgmWpVWvB3UmlEckUIkNcl
	79EBe+0GyvyLTKLbvind/uvhahpOm0VRHJe+GXULRW5a3WO12cqC70sfJLh2dp7SkmwkDMHnvW0
	AlRr3Ni
X-Google-Smtp-Source: AGHT+IEMalXyUAnyGSz62XZRT5YFJWbI5kdvTffoImyStrvRVjF3+40V1XYpBrzribrK2v+XrhzX3WPi4NoLw9+2PrM=
X-Received: by 2002:a17:90b:4f8e:b0:32e:7270:94a4 with SMTP id
 98e67ed59e1d1-3342a22f5c5mr6887375a91.14.1758881137573; Fri, 26 Sep 2025
 03:05:37 -0700 (PDT)
MIME-Version: 1.0
References: <20250922-fix_helper_data-v1-0-905e8115a24e@oss.qualcomm.com>
 <20250922-fix_helper_data-v1-1-905e8115a24e@oss.qualcomm.com>
 <874isuo0m2.fsf@rasp.cworth.amperemail.amperecomputing.com>
 <f7be3833-9b33-4935-b821-a2e0000a2557@oss.qualcomm.com> <CAJ9a7VjaUE+iy=FFwPhCdfXgoGR3rP9WSx-ZkKYeCHhqJ2yzMg@mail.gmail.com>
 <3b16607f-8995-46b1-aecf-c6aa79f66f9d@arm.com> <635ba698-d7a9-40d0-9285-4ec108d4a536@linaro.org>
 <20250925160440.GD7985@e132581.arm.com>
In-Reply-To: <20250925160440.GD7985@e132581.arm.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Fri, 26 Sep 2025 11:05:26 +0100
X-Gm-Features: AS18NWCbpLCP6YCuwI_-fvwo1ZyLR7pxEbvV2zcB8LL4Hx314A6kIEBoWPgSxQk
Message-ID: <CAJ9a7VgvWHO5h9-VbSruAqLfgocbkRjzsY+THPHVbJT2OXUO1w@mail.gmail.com>
Subject: Re: [PATCH RFC 1/3] coresight: tmc: add the handle of the event to
 the path
To: Leo Yan <leo.yan@arm.com>
Cc: James Clark <james.clark@linaro.org>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Jie Gan <jie.gan@oss.qualcomm.com>, Carl Worth <carl@os.amperecomputing.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
	Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250926_030538_771830_5E537E3D 
X-CRM114-Status: GOOD (  23.09  )
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

On Thu, 25 Sept 2025 at 17:04, Leo Yan <leo.yan@arm.com> wrote:
>
> On Thu, Sep 25, 2025 at 11:10:51AM +0100, James Clark wrote:
>
> > > > I would suggest in the csdev (coresight_device) structure itself. We
> > > > already have some sink specific data in here e.g. perf_sink_id_map.
>
> [...]
>
> > > I think this data is specific to the session we are enabling the
> > > device(s) in. e.g., we keep the trace-id in the path.
> > > So, I don't mind having this in the path structure.
> > > Instead of modifying csdev with additional locking from "etm-perf"
> > > it is always cleaner to handle this in the path.
> >
> > Yeah, and perf_sink_id_map only "needs" to be in the csdev because it
> > controls sharing IDs between multiple paths which can't be accomplished by
> > storing it in the path.
>
> This is a bit off-topic: do we really need to maintain an id_map in
> every sink device, or could we simply use a global id_map?
>
> I might miss some info; anyway, consolidating trace IDs is a low
> priority for me and not critical to this thread. But this might be
> benefit for later refactoring.
>
> Thanks,
> Leo

There is a limit to the number of IDs that can be used - using ID map
per sink means that IDs can be re-used in different sinks.

This was added to overcome this problem in large multi-core systems
where there are more PEs than Available IDs.

Mike


-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK

