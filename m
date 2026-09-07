Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41594C79F9E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 13:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D/v3Jz7xvaKh59QLJ99lH4pZEIIORIIk9YVsyFYrUK4=; b=Kmhy6fHxkXIQYnIvS9LqsjSOyU
	eSUyWNiFTS5LbipmEsOAotviazkqgEVlQQvsiNCrXwnWf+FV6DdnI1TBO/JeIHRGa89cGd9AIkdZt
	C07jSfkFlMQJHReQfqYxSa4XbYr0SNbEO2WuK9CX85NVggWsvl7vJpGiAWwu1WYI1DU6YGI515sud
	X4LJi+wlMh/0Y/5zKoERVPhbqaLtk0MCVGnmP2tgODWY+XiOQmVX4oU4WPQYfZ1Qgs6ncdR7u5/ix
	zfrU1Q+n/0nxmDNPw4WWvTFibtvw+nLmDWtK23iVD+/vvIOUZk9bv0A7zYCwIiS6V4Ns43BurRtEx
	Dj+DYRxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3Zdt-00000006yGj-1uPE;
	Mon, 07 Sep 2026 13:44:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3Zdr-00000006yG5-41mY
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 07 Sep 2026 13:44:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=D/v3Jz7xvaKh59QLJ99lH4pZEIIORIIk9YVsyFYrUK4=; b=ndGwdYsD4FN09GYR+Hoo+9Zwym
	itE5scEWwAcg9/KfqpM3uooq7eeCenxUtLUmuXMqkOnil9GEjwWC8FOZ8GYggnV/UvlCCZF95VUKi
	zBIvf956WMHnTXp0nKP2h6hYtBaSNvPDbzdMfRe1F1sj3RzodRvpd1QGZTT/zg6n9rO8UlhNeWVqY
	R/q4CQNEm/UrRbhrq9OzebsMACgqySWzgDFZLv2g57rZFoxRw5GKhuEW+uCm/lPBYcj9pgwSmThHn
	OECqsEDHpZPrHH1u1Uem1aOQYLKBc1IvUkhYCMkHhDU8YVs9DI3Kbnhgx3FS8rEKpsSK+JvDVXMlu
	YUk3gYpw==;
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x3Zdo-0000000GI9t-3eop
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 13:44:10 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-398c1101c1bso3408462a91.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Sep 2026 06:44:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788788646; x=1789393446; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D/v3Jz7xvaKh59QLJ99lH4pZEIIORIIk9YVsyFYrUK4=;
        b=jdNIb8MAzphhFMvE5cQjkFxl7yc9lCVWq8Ue0rIUcc4UVEUbGry7xY4mxP8HiD9TVn
         Td+63Ea98VJRQ1mXLB1TqjOTB5C4YOEtgZNzRp4mQEsykx+oPynfMocBdcqcQk8nfXjm
         6ho8kJXSf0rNKTqNEJD7tTIbDz+t5TXTMevEhanyMDkn4lPQ5dJBIjVJ1LfYuWWcu8KH
         GICFPTK8Iomw5RqwendvTPvKHLxgu/MvsChWhfrO3acjJqWK9EjXNLargyeH6Nglcrxc
         2BOBocjeuskUqkCQHRt8GRyy4FsUg2a12zmJuDlN2BHYoT+Hk+Vc3ts51siB1MP5ngKa
         vTjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788788646; x=1789393446;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=D/v3Jz7xvaKh59QLJ99lH4pZEIIORIIk9YVsyFYrUK4=;
        b=iG10h8VUFFDI+eTV7yCtzmYYHtPW8haBmmOCq73KvXlYWDAKYnn2svZPP2r99j6YXY
         nkTn4HK8opgchjnD/YjWnhgZ0MYEne9yQ0jqQiW/EG2xjVzmlycxBK2biCMslnm95SVw
         XsAF0wh+Or9csg6YJ9Vv47JjPZljP1i3K+B3KI0D7BsE4MTJuYdVv6yCp0Aj7/fS53cA
         8FS/dhho7/ztIsWexxbAtcLpXTvDDFONcM5byo5ReqcBNf/5K+bicIAkk46xf/dJDRVa
         xrvdDYEVnZWNE/+UHYBpk2DAg1pMzn9SuZRBybzIYg7ASTWVJ7sb+bvN36CvCYj4FD4i
         HrDg==
X-Forwarded-Encrypted: i=1; AKwUvBzPJcHyTHVyqYCJ+48aOm39N59Zphf6aLnvWBoK/wzEPSjaRtD5wf3G8m2gJo/b1dDW9CW8sqM93oHjluRGNe7z@lists.infradead.org
X-Gm-Message-State: AFuF++k82XgXBkW+GCum3UMV/U6uoK5Z9ieewIbP6m9CpAMRdDWZDlon
	U4e8W4whGGCemRiEdJz4xSgxgfKD9wvPevfzvAXCAoyrHxFw+PL8Yd8=
X-Gm-Gg: AYBFou1+jBmHM1I7Hr1Xb//1O5dVI73CbuCCphyVQ2MSDFYHI39tz3JtYYckZUKXpQf
	eCXAYNPhXxWlOTwqcdWrXLebp9XlX9V36c+79MVLHDWeLrOVss7Iz7dGRqpMKBkaBYuGgs+pqwy
	4WyHembgAJ49A/T8SoC9wUBgfTgg+MpD/pffp3ArYk+2/N839lsvuW5WMHG4kSORbBZ0sg1NyLP
	tVlGxqqIUFlgRxGL2EafyUN8c0NTV/tRnlsu5ITqiG/9hY8plWJUVjEZBwx0l6qSR8es8fizmPJ
	Pmbyz2/0dK3PYk/9rKXV4EWw4H3SVhMvWdgMfiqVZMy1gwnu+CUVMokaTxXgpBhkduE1CcieUD8
	1wQN/fYSu7RjZ9v4/UeJMdl9YLxwmvrKFO/7iXRQifeVIY0zwzx9sKrn75gVxfeS2/kONr0J/yz
	weNCftMQeMw590b+1XTOfiZtOu7CEvuIjvQewbjbRwUljCYdYcUGtdriMR4bb9XMHFiTOrjl26c
	VG2ZOrB9BUb5lGR
X-Received: by 2002:a17:90a:ec8d:b0:37d:f983:7b5 with SMTP id 98e67ed59e1d1-39b26101c08mr33965509a91.9.1788788645675;
        Mon, 07 Sep 2026 06:44:05 -0700 (PDT)
Received: from ydg-Zenbook-14-UM3406GA ([2001:2d8:6467:d689:c773:5f09:906c:a72b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b2612d3f1sm20717513a91.13.2026.09.07.06.43.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 06:44:05 -0700 (PDT)
From: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
To: Alexei Starovoitov <ast@kernel.org>,
	Andrii Nakryiko <andrii@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Puranjay Mohan <puranjay@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Song Liu <song@kernel.org>,
	Will Deacon <will@kernel.org>,
	Xu Kuohai <xukuohai@huaweicloud.com>,
	Yonghong Song <yonghong.song@linux.dev>
Cc: bpf@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	donggeunyoo.kernel@gmail.com
Subject: Re: [PATCH bpf v3 0/2] bpf, arm64: fix the exception callback's frame pointer
Date: Mon,  7 Sep 2026 22:43:55 +0900
Message-ID: <20260907134356.616964-1-donggeunyoo.kernel@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260907130624.611942-1-donggeunyoo.kernel@gmail.com>
References: <20260907130624.611942-1-donggeunyoo.kernel@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_144409_168944_160BBD16 
X-CRM114-Status: UNSURE (   6.84  )
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

CI reported CONFLICT on this series. It applies cleanly as posted: git am
of the list copy onto bpf/master, which is the base-commit above, and
onto bpf-next/master both succeed.

