Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4FECC36014
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Apr 2025 20:35:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ur2Tr6iw7X46fc/5bRLx6fdqJrE0cltK+bwwRImun+Q=; b=i21R5qtD/PemQtZA0qdJtMMxbZ
	M8XJhu50FecfIJO6HVlkNtKm8KyIXSh6gNm2rgDyUx/eNwxCoKW/0iIni1tNB6ZAwe6Xz75c5fQK2
	nFPY0dWDXMkIOmOZcaN4KaMJ3kIxdQstmiXT8V12X0tYK/R88sGC+lAjEKB6o8b5va94RF8zYAmK6
	sZkwkRvy9dK5P7qKItzudghs6CKMxjeDagfJ8BxPZUjIHg4fTUH/5BtqcU8JmsBcA0yWyGFWbeq3Y
	pZSLkP22pJP8naW6xGT6y2zJ6Fx6nush9Us3N1cdV6GTgwV09ykuNn3ReluVUWNbPdAmAmk2g9c9f
	jMX8r2Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0RHJ-00000009yxQ-3vP4;
	Thu, 03 Apr 2025 20:35:09 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0RFU-00000009yTG-1D4S
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Apr 2025 20:33:17 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-3914a5def6bso860294f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Apr 2025 13:33:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743712394; x=1744317194; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ur2Tr6iw7X46fc/5bRLx6fdqJrE0cltK+bwwRImun+Q=;
        b=Zhsvoa1RjzTAp9oK1D1U6b0kzWWAob31XHbB5BwN07P37xFoFybEFF/fCs48bLogYp
         gYgEZi4SaLCVeGom5wEb8kN4U9xfgzYfc4/HY5m17rj+z+kBd8p1IarlMq6j3/BznXS4
         LF1uvaIUcWlqGnEM9wyG/IUdpsgf8X7TMciWyDzVAU4W8dWup12py4PCEulsJqipLNXL
         +S1uJ29FxRNdjzzz4hZcT32IZiREI8t+ukyC5VNzbJ/YNSAL+3yNibqZvb4sLxLwfv+9
         ZzM4Mn1LS9Fn1bdoQWA6eHvmpp2OdI/6O44lnmymwRIL2dhwiHl40Jr3aYyNwvjb238f
         o3xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743712394; x=1744317194;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ur2Tr6iw7X46fc/5bRLx6fdqJrE0cltK+bwwRImun+Q=;
        b=gnosNC0PgNNfjh7qy4HV2cw7I7GnVRqE/iDJBdi+09x+VBmo4zG87L2GCN+vg9JlEy
         PZzRjX/yqeUWGy11dtdV49l9wdswp3F6hOFBJJJ9VfZ+pzx/Ka151roQB44KrRfvUUFB
         3I2jcvc762eCaLj4telZ4ggqLqWQ8MCbzVlLToRxvb+shTkzjVvwGAwqzdBbmjgeUZOx
         1hbyOQ9oebY5AIC1NVHVt0SHyTD/G4KfXii9ZPT8jokK6MBhKhnvRHcloiobq5zf8P2b
         Mj+KXOdTyEHdUYjDzfQl6bJrK9uZ5zKczFNxAsd9F9uklrpham0LTs0rLYULqqajN9GA
         Y0mg==
X-Forwarded-Encrypted: i=1; AJvYcCUR43FBGX8XkgeVbqMBbnBXqvBf9JcXGLetPLQtdULumpmcfoRrWu4fnRW8OT2E5wfJcCHVrhjK24koEUuhq1XO@lists.infradead.org
X-Gm-Message-State: AOJu0YzxPIQrtQkq1u2BLvOIPRJma0NZkqhOkATD0Vx9BSot6DfJSWxE
	3Noum43CnqKc+xHodEL+5ZackpxxYqtUpazEM5oQ5l74o9b6XTWW1A4HumwigaLKJpuhZDm3T1J
	24XdNvN3i6R/9C9aLYCLy1929Slo=
X-Gm-Gg: ASbGncvVIjwof67dTfQ9XZfPwxoCQRIZWkOUltTci2MFC6DlSVogsebW6edl5lYTERu
	e1AO1QoMhJRBAiPjHzDXZvNXjfwnnO/LRqFOqQJO83PtnsslUfke/0zmVCf7gngDIrBxTTA6WYZ
	Ps/52fluE5XcIiC+9JtdKfeBvunt6nh0ChFlF5Gg1A2Q==
X-Google-Smtp-Source: AGHT+IEu34HOnVSPLCEPZgUjMqgj5ikBMtgLqNQ7LH7V6Xsh1zQa1uWkmsD6Y8njY4+v2/UFK6c0Z5jpunIin/qN29o=
X-Received: by 2002:a05:6000:4284:b0:39b:ede7:8906 with SMTP id
 ffacd0b85a97d-39cb359572bmr610867f8f.19.1743712394400; Thu, 03 Apr 2025
 13:33:14 -0700 (PDT)
MIME-Version: 1.0
References: <20250313172127.1098195-1-luis.gerhorst@fau.de>
 <20250313175312.1120183-1-luis.gerhorst@fau.de> <20250313175312.1120183-2-luis.gerhorst@fau.de>
 <CAADnVQKL-NwxigMWM+U=n5ZXPG+xHYzSTEv0Rq8Y91m45eRJDw@mail.gmail.com> <87cyedie3w.fsf@fau.de>
In-Reply-To: <87cyedie3w.fsf@fau.de>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Thu, 3 Apr 2025 13:33:01 -0700
X-Gm-Features: ATxdqUHPAFiAlWbRvEI6Dyb_uIy-F7VX7qdc8juRjqz8Jt6HEvin01eMZNJzsww
Message-ID: <CAADnVQKAFfOKWe+rdvaM=sKp229Kn14jj=K6+8oybw5m2Mh-RQ@mail.gmail.com>
Subject: Re: [PATCH bpf-next 11/11] bpf: Fall back to nospec for spec path verification
To: Luis Gerhorst <luis.gerhorst@fau.de>
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Puranjay Mohan <puranjay@kernel.org>, 
	Xu Kuohai <xukuohai@huaweicloud.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Hari Bathini <hbathini@linux.ibm.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Mykola Lysenko <mykolal@fb.com>, Shuah Khan <shuah@kernel.org>, 
	Henriette Herzog <henriette.herzog@rub.de>, Cupertino Miranda <cupertino.miranda@oracle.com>, 
	Matan Shachnai <m.shachnai@gmail.com>, Dimitar Kanaliev <dimitar.kanaliev@siteground.com>, 
	Shung-Hsi Yu <shung-hsi.yu@suse.com>, Daniel Xu <dxu@dxuuu.xyz>, bpf <bpf@vger.kernel.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, LKML <linux-kernel@vger.kernel.org>, 
	ppc-dev <linuxppc-dev@lists.ozlabs.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, George Guo <guodongtai@kylinos.cn>, 
	WANG Xuerui <git@xen0n.name>, Tiezhu Yang <yangtiezhu@loongson.cn>, Maximilian Ott <ott@cs.fau.de>, 
	Milan Stephan <milan.stephan@fau.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250403_133316_326095_3CF8CC60 
X-CRM114-Status: GOOD (  11.33  )
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

On Wed, Mar 19, 2025 at 2:06=E2=80=AFAM Luis Gerhorst <luis.gerhorst@fau.de=
> wrote:
>
> Thank you very much for having a look. Let me know whether the above
> resolves your concern.
>
> In any case, should I separate patches 1-3 into another series?

Sorry for the delay. lsfmm was followed by the busy merge window.

Please rebase and repost the patches with the detailed
explanation of how lfence works internally and it affects on
the algorithm.
I mistakenly thought that lfence is a load fence only.
That it forces all prior loads to complete, but not the other insns.
Since it's an absolute speculation barrier the algorithm appears sound.
My only remaining reservation is a heuristic in this patch.
If we don't do it, we wouldn't have to special case push_stack() too,
right?
Let's continue discussion in the new thread.

