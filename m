Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E75C0C98338
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Sep 2026 17:34:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:Cc:References
	:Message-Id:Date:Subject:Mime-Version:From:Content-Transfer-Encoding:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MuL0v1f3+J9yyQw0yqK0TvcdFgWSs593LTmvyHRza0g=; b=LtGawJFCivXDdh0eq5cOdaavjI
	miqUFvP6Xd/vj+bHipldMziRqFFlBzpx+5YxIcrkHq2NDnc2BaHoSsGKhFHBljDI/1BuMu3pyXuuU
	iaU5V7oK85T4U4C2I/444ch7soVbkipKtbMlWvv3tICFPMGiSuOxmhDu2r56cvhXOC+tP77MGEqxc
	IF9edLA6zp8/j7idRwal6LmdLNMPU7HzLGkHNXyk4BRN1pkhrxUqLNTuxgPZaFl742Ci0Xobaet/r
	14WrsOHw3n2uZZUGjMUl0Yz+ZXpyIs7wfEKNwkNOJ7QkVtCn1gINR9Z1bxoyzZ/5AToTqCsz0FeeO
	Y17wYGVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAslR-0000000GeX4-23Oh;
	Sun, 27 Sep 2026 17:34:13 +0000
Received: from mail-oo2-x2a.google.com ([2607:f8b0:4864:31::2a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAslO-0000000GeWX-1qFm
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Sep 2026 17:34:11 +0000
Received: by mail-oo2-x2a.google.com with SMTP id 46e09a7af769-81be5042c56so356208a34.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 27 Sep 2026 10:34:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amacapital-net.20251104.gappssmtp.com; s=20251104; t=1790530448; x=1791135248; darn=lists.infradead.org;
        h=to:in-reply-to:cc:references:message-id:date:subject:mime-version
         :from:content-transfer-encoding:content-type:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MuL0v1f3+J9yyQw0yqK0TvcdFgWSs593LTmvyHRza0g=;
        b=ywtxqQclqIzAmytIK6LKNhUjRylWTxEYFCgJj6uq7hzSjDoeXYVNnk4edNZaSuiMc6
         trxLoHksMX3BFg42vBrnt2CHtnf1cz8CYGuYiEencnWSncTyvD9llUzmQU3PeKyh+KY2
         aelDURbwGwU1tqxLfh3ANBpaS7pDV5B4LzuTpaxaPigexDO2o3sYqB5kF48FjDzqUR6w
         l/6052zqTj1vrTLJF05+Jls8IhT6aPxPyxLWnDBNq82DK5lZtL/GiAjzSgpBa7y4kyuZ
         nzHh+wYT/KfixNfFCgftEmbePAQ8Q85p9H8Kl4zkJIzgJGOsMa54yYZsVjFVAcYz+PSx
         Hk6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790530448; x=1791135248;
        h=to:in-reply-to:cc:references:message-id:date:subject:mime-version
         :from:content-transfer-encoding:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MuL0v1f3+J9yyQw0yqK0TvcdFgWSs593LTmvyHRza0g=;
        b=rw9Ahutdz/X890a/qCxp8IdS3caSlklvsA0aSQ4EBOdfyu/vKNLi1ZbcRMuY73W62u
         uGQQ8a06zVeJi3+sw9H6G0VUkk5LUTrdsf2nYnnb+2AVLjHWTbPBTBBGWWQgBM1jdpCe
         cUvJJYem0yrMEMbVUv5Li0TRNQZU7q4zgo+jI51WF78P0/9Y82oSU+HUIt9cMyJhIUAY
         hbawEt11qQbJhIqpsgzBVjw4ecCbR/CTMHSjQI1YtGzv3GGafSHhDUusm4YpH/S5GMRZ
         NN/TpGU4+KB5a/PW135byGLlcmXRdrKxbS05UlpvHbgIVdnKOj/HGpvyV9BA2i+KwrdX
         5CTQ==
X-Forwarded-Encrypted: i=1; AKwUvBy2IESSZlqA7C/AsNLzGuFRZQSOVQ/8H1MXeZuvmUvRgMCk0LWWeiADphhwO4tFMfMQxW/XUQhlrysXy1BytTNw@lists.infradead.org
X-Gm-Message-State: AFuF++mApeq0mDZ6flCyMjUwXTR7U/qFWeA0My/cxbHcSc3vjfq6itj0
	e4NSHdqhtvB733clsuNZSLn+39zq+2tchRxbnjvqQmLVSnSoL7RsW9aOFg2uoUggjw==
X-Gm-Gg: AYBFou3OCscSJNQTgqTYaayQkpO6itTxtS0+AFAZHDQNGbCALV1jwT6A3YNhssm7E8g
	X0/dMKihUgJXSBOKJahM5j2tw/Rdmbq4/dgwzzwqmNc2a6fF8g34LjvAJaL7/vNOz/gaGNDqnGp
	Iz0MlT5VlRMCt3+nKzotcwayOGlXNb7ZGtiU9Id6+6XSeVjLsx+bWpyhFn4MVoSDjO1yxPcmdjR
	NTaE73cSfGLmn+m9kKE0t5ir/36YWrk5bsuA0zbRwjvkW6+7vbkFNhpyRD9JQtIeymahFilmv4X
	LhZwOnw1lrDgn0O9SvtPLI2gizS3Kiie3UpSKCT8F3AQ1r1ICuXqwfqAXill8tqKv6lBzpyqFFS
	+3YiZxTz2kzTRGe1RkYuAlg5lnz1qFWYgplSZJR9OJPJi1BzBKYFrmHtiWCny1ioocxUt2WDVaw
	khWXNutILjcc/RWgvBznQzO9rcXMgmrD816kLKbjhrhiWEQjdKGj72OwLxMZliQ3jXcGV0JkH+O
	sUuK+cYTVjimi9FgPr4ctWYPqO3GQ==
X-Received: by 2002:a05:6820:820:b0:6cd:3ffc:64d2 with SMTP id 006d021491bc7-6d5bac3e146mr7371645eaf.77.1790530448403;
        Sun, 27 Sep 2026 10:34:08 -0700 (PDT)
Received: from smtpclient.apple ([2600:381:5ba1:a8b2:19d5:7f67:de2b:c3a5])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6d883394af1sm2755239eaf.13.2026.09.27.10.34.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 10:34:06 -0700 (PDT)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Andy Lutomirski <luto@amacapital.net>
Mime-Version: 1.0 (1.0)
Subject: Re: [RFC PATCH v2 0/4] mm/swap: reserve swap areas for deliberate offload
Date: Sun, 27 Sep 2026 10:33:53 -0700
Message-Id: <3FDF3191-94A5-42B3-A33E-12021344D7BD@amacapital.net>
References: <20260926045517.3458413-1-matthias.goergens@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Chris Li <chrisl@kernel.org>, Kairui Song <kasong@tencent.com>,
 Johannes Weiner <hannes@cmpxchg.org>, David Hildenbrand <david@kernel.org>,
 Michal Hocko <mhocko@kernel.org>, Shakeel Butt <shakeel.butt@linux.dev>,
 Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>,
 Yosry Ahmed <yosry@kernel.org>, Youngjun Park <youngjun.park@lge.com>,
 Baoquan He <baoquan.he@linux.dev>, Barry Song <baohua@kernel.org>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, cgroups@vger.kernel.org,
 linux-api@vger.kernel.org, Alejandro Colomar <alx@kernel.org>,
 linux-man@vger.kernel.org, Karel Zak <kzak@redhat.com>,
 util-linux@vger.kernel.org, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Vivi Rodrigo <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Rafael J Wysocki <rafael@kernel.org>,
 Pavel Machek <pavel@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, linux-pm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Shuah Khan <shuah@kernel.org>,
 linux-kselftest@vger.kernel.org,
 Matthias Goergens <matthias.goergens@gmail.com>
In-Reply-To: <20260926045517.3458413-1-matthias.goergens@gmail.com>
To: Matthias Goergens <matthias.goergens@gmail.com>
X-Mailer: iPhone Mail (23G90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260927_103410_748499_FDE77E0A 
X-CRM114-Status: GOOD (  14.42  )
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



> On Sep 25, 2026, at 9:55=E2=80=AFPM, Matthias Goergens <matthias.goergens@=
gmail.com> wrote:
>=20
> =EF=BB=BFThis RFC adds offload-only swap areas for deliberate cold-page of=
fload to
> backends unsuitable for pressure reclaim. ZFS zvol swap has documented
> deadlocks under memory pressure [3]; compressed swap is another target
> because writes may need memory despite free logical slots.

This seems unnecessarily annoying to configure. It seems to me that you=E2=80=
=99re creating a bizarrely named administrative flag that means, roughly, =E2=
=80=9Cswapping to this location may allocate memory=E2=80=9D.  Why can=E2=80=
=99t the kernel figure this out itself?


For that matter, how well does this even work in practice?  If I configure t=
wo swap devices, one =E2=80=9Coffload-only=E2=80=9D and one conventional, it=
 seems like the relative fullness of the devices will be mostly an accident o=
f what triggers swap as the system is running. If the conventional swap fill=
s up, is there a means to proactively empty it?  Under OOM conditions, will a=
nything preferentially kill tasks that reference memory in conventional swap=
?

Is the locking and recursion structure of the mm code such that we won=E2=80=
=99t have deadlocks where cgroup triggers swap to an =E2=80=9Coffload-only=E2=
=80=9D device, which allocates, which causes memory pressure, which then tri=
es to swap more to conventional swap?  (Maybe this works fine.)

For that matter, if the system is under overall memory pressure, why do you c=
are what triggered the particular swap operation that is being processed?



The remainder of the writeup is IMO somewhat incoherent.  To the extent that=
 AI was used, can you read it and make sure it makes sense?

And the first few hundred lines of patch I skimmed seem like incomprehensibl=
e churn.  Adding =E2=80=9Celigible=E2=80=9D to a bunch of calls does nothing=
 to explain what=E2=80=99s going on.


