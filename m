Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 994AEC282C6
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 18:54:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tb5V6oxMTc5Lgs5t3WuZtNTHjuiR0TEmQLLvfX9+d/M=; b=OunKdzbqJHQnkvqeYrNkY968sH
	YRgCoCLIFRaY1ZUE/o4EcJRtVKaJRXM0I1e9eqQHwZtgW3Dyk0bptwMe5Ori4EmaYtcXrv7+Pe26E
	GpDfOuNSA1TvpA6ayNDjcYCeFyMGFSk5ONe7iXTAeVBdftBQi9I6+MXf2u4xFMBfhC/sUZyROmbd0
	67TuLg1FBK03lue9rN/C0Ge3JHm9e3IawrWdCsJ7gGJvqPiuhJENf5LU4ZHSaHl6NCfTaXxxwQ4Is
	2QdqB+LmDJWVk+VFP1t1GQ/4/uxOSqk7vHcKxtwog4S/3u+mIIix5OX17v/8RCDa0lpojwLWNvaOt
	J02mY/Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpAve-00000001zkC-1nLD;
	Mon, 03 Mar 2025 18:54:14 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpAtq-00000001zJQ-2gMZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 18:52:23 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-390ec7c2cd8so2273488f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Mar 2025 10:52:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741027941; x=1741632741; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tb5V6oxMTc5Lgs5t3WuZtNTHjuiR0TEmQLLvfX9+d/M=;
        b=fr2ub3cP2SYq7CttNkdAhHMyttEi2JTdl3yOMVA79zw0wTyE9wqhslj3wNw0RSFJcC
         lhGFisrosP/qHswMySyZJ0S+4+CRueN5FeK/wxGes4b3M1qfoSvRo5J8qCsOcDwNQgIe
         Ktq/+GNyP8Io7gVr0Y0p0/K65hIw9iPHAaYN9e+i/AqVtH5ovmGS/YMbHHuhW1lymAym
         1GbMGl57IfcDKmLkGPeX3FE0edOGYCmvehEcaYPcKmDKByAdS0pPWMKMJQA+ZVKABdhA
         F3NKufzBDWzWjG2N9ty+WEv+KrdcHXGPvKx4hllSrEVy1A7xBeSQUWKdpOu+EcLqNyRy
         VWwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741027941; x=1741632741;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tb5V6oxMTc5Lgs5t3WuZtNTHjuiR0TEmQLLvfX9+d/M=;
        b=s/Z97sUum2JxlMkRFaQt1BOEVTstysG3uvs/vmpr1A+A1idxO7jfc+ZNvVpOS6zXnc
         d1SCZg1dy+1TV3vXHXfrwjafoKhOL/apM5olrx8RnZ1qgf6UqqXt4HVEa9ssUuSLpwfz
         uku0BhVh5yMFmjMXsOgayd5ykNy6APmyxn+lnL9KB/gWPOnCB7QJ5Zz1CuuFgUGjZntL
         5QKjq8pr1fP0RLxQ/6jE9Lnm0cTDKtzxSANDIOU2ebT7c2d1qk+sRNRsBxTqptoqb++P
         Znh5RCa7H5oL3+M91m9h4rj4/b9oY+Z2bbLPvzvTsJEn+HF0141db/WaVUC//2GHU0Ai
         k5jQ==
X-Forwarded-Encrypted: i=1; AJvYcCWYjs/kQI7jMkJUQJOaxgjHa5UIA/SKXNpvAeSCinTHAOsK8gUzkDcBguDzJJIqD+r3Xg5ANdZNTVMfCqsZjU6f@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5zr+wd0xWzRZZ/T2t6Jax91Q00AVDCwpuvm4X/ViHI4nkNFPT
	4XSxGTfDsgL/ayb0b++QL7pL79H/7nZSFKhm3bceTRciN+38UPjmogEf1MgHC53dp4ITyCHLbOp
	8UW6cmuN0X5Zv0AI5Q+5HmIzOAZo=
X-Gm-Gg: ASbGncuXvD3rSg8xlkG2DbOB7zUUo+Cb9rpfI8dl9C8G8ddHfNT/NGlNh82vYINxkkd
	b9qv60C3z4jWVhs7vRMnjxtZqyeJrY+KLu5KX+cibOYOCZ92xSRM5kuXEdwBWujOV9nmMDOYR8O
	rUxVMcVowRql0A5e6h6SaFVAt5+hrV/xP9+IpWU90o8w==
X-Google-Smtp-Source: AGHT+IHnZBbHX4QElW1DWMreZTHhDpaQknBh51JcyUMZfBlOP/B0HyGo9KEmQZFrsra49723GFGoT6jKhOTVwWemjok=
X-Received: by 2002:a05:6000:1f8d:b0:390:fb37:1bd with SMTP id
 ffacd0b85a97d-390fb370470mr6928710f8f.46.1741027940749; Mon, 03 Mar 2025
 10:52:20 -0800 (PST)
MIME-Version: 1.0
References: <cover.1740978603.git.yepeilin@google.com> <8b39c94eac2bb7389ff12392ca666f939124ec4f.1740978603.git.yepeilin@google.com>
In-Reply-To: <8b39c94eac2bb7389ff12392ca666f939124ec4f.1740978603.git.yepeilin@google.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Mon, 3 Mar 2025 10:52:08 -0800
X-Gm-Features: AQ5f1JpXrd_zfB7BE28u8dY7mQWsRaJQVmXworXNHuBlKbek7ljLtxiaGy0Y8Kw
Message-ID: <CAADnVQKyMx64_mP+u+rmnRGyzVoBs4rViTHeE4_0Rr+Kf3R5Tg@mail.gmail.com>
Subject: Re: [PATCH bpf-next v4 03/10] bpf/verifier: Factor out
 check_load_mem() and check_store_reg()
To: Peilin Ye <yepeilin@google.com>
Cc: bpf <bpf@vger.kernel.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, bpf@ietf.org, 
	Alexei Starovoitov <ast@kernel.org>, Xu Kuohai <xukuohai@huaweicloud.com>, 
	Eduard Zingerman <eddyz87@gmail.com>, David Vernet <void@manifault.com>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Puranjay Mohan <puranjay@kernel.org>, 
	Ilya Leoshkevich <iii@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Quentin Monnet <qmo@kernel.org>, Mykola Lysenko <mykolal@fb.com>, Shuah Khan <shuah@kernel.org>, 
	Ihor Solodrai <ihor.solodrai@linux.dev>, Yingchi Long <longyingchi24s@ict.ac.cn>, 
	Josh Don <joshdon@google.com>, Barret Rhoden <brho@google.com>, Neel Natu <neelnatu@google.com>, 
	Benjamin Segall <bsegall@google.com>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_105222_680486_4F5E4094 
X-CRM114-Status: UNSURE (   7.43  )
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

On Sun, Mar 2, 2025 at 9:37=E2=80=AFPM Peilin Ye <yepeilin@google.com> wrot=
e:
>
> Extract BPF_LDX and most non-ATOMIC BPF_STX instruction handling logic
> in do_check() into helper functions to be used later.  While we are
> here, make that comment about "reserved fields" more specific.
>
> Suggested-by: Eduard Zingerman <eddyz87@gmail.com>
> Acked-by: Eduard Zingerman <eddyz87@gmail.com>
> Signed-off-by: Peilin Ye <yepeilin@google.com>

Applied the first 3 patches.

