Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C30ECEF8FE4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 17:27:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9xcoW1uuOqJuCGhLK0+3X+GsY8ZmUZ0iw8x7VjTHzj4=; b=2lbiTO1Arz4L+84kIJbc5yaY7q
	QvRN8T727KGR6O7F5PxHjYYlc9jiEPNGTvxtJHZvBHkS0mIRkw8y/YI8fPYPkCZ0b0jXyXeL9RnXD
	tBHfHM0QR+zAdWzhq9A0mytzFD8NbrUQ2yCMZWu/LVZGsHtUWIBbrQfbpnw2DpFMu9M/845Mo62w8
	yPARlOo/hWxty8xW+FDZryeR1FAoGb8XoSlANZlily+WyDe51LT+re8aTkpaTz49FwcX6rOSa+bUa
	I6itgqfV2/M8TMgr1NtctVFJmIxNsRp1UdrMM1F4hywOKN8UvHQ/DjOQcOGJ02uhFPLmX2G6EcXdV
	VREpZpWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyCTx-00000002IuW-41kr;
	Thu, 05 Mar 2026 17:27:29 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyCTv-00000002It5-3voZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 17:27:29 +0000
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-3870df2331aso69217961fa.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Mar 2026 09:27:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772731646; cv=none;
        d=google.com; s=arc-20240605;
        b=SxMbPB9UeAIlIECPNIkWF+tAJzb9MIlprwj5dBvPBUIyfvtMhStLhB36/s4LqDVlIK
         iTuUh+kriaU5kEHMpPNtpf0oS+anHmj8TInh4KEB7He6qcucJXeibYUf+AQRPRpJYGiw
         510VoiksKfMUZxnA0HBED7+rlybvuA7YHz+U865CQE3BhQyhSDd57kPa6YBqpqF/mELQ
         tXO00Rb8i9kvLDeXiGFMLPlq3N4t8nRzGjB84HvknpXNnzmRJyeNxuRrVxb4vCmchtn8
         d3Q1g/V+Cu/46jPKivMcVaLS6Fza7qX/PtQf2zGC/rPV7fNRMKhx4eBvC9f3vBYyAaBA
         5CCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9xcoW1uuOqJuCGhLK0+3X+GsY8ZmUZ0iw8x7VjTHzj4=;
        fh=ks8MFM2R99qSsBcvNBDdYFl5lk/Hz0rtKZFLZP23Gx0=;
        b=ety1ro7H2b+etk6UKUCvQFJM72uTHMECHe9xUVVZaiWbeindsW31Pg5s/pxPK5pENQ
         Pv8fnz7mFilEMFRDmw5crC7IFeKxmoYEyS48QwWdxKGfZg2KJg+YKBB8dELpcDvAVV9f
         1ryxtoSQiWasgFRK7mZ8SmN9X7xDLlf1MS0Pua3LPea7VDRZIJ1vlAsT+Gq1l8vpG8w9
         ZuntbcZU0aJDXgncWPM90CUMCS3/ITY/o689lJG0L+QUquU3Uafjgx2IMXJoaLMuuh4P
         TidOIfufwA7mQkJmnmqvm6+B1+COTjl2i1/e2EJZkwflsctULpa1U/iUGfRIyL8j+wnQ
         eVEg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772731646; x=1773336446; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9xcoW1uuOqJuCGhLK0+3X+GsY8ZmUZ0iw8x7VjTHzj4=;
        b=hO8GssZADpS2+Qu7DYjCmTsWiiRghESDYG+7q/J3yiUluTY5e7lG0jtPPWqmbpgGiR
         7OAduTwpTk+Uka56yvW/3Omr2K2wZROGp4NLK2CZtCKwJvki8PATw9JY+kgG/Gwjyvoi
         T03sTZfhiptkP9auyWU9TU6wFV/+GYsAAsA3PwQjZR9+cMCZ6oIKbF11VO21QEL8kBKh
         oV3er1Je0BmceEIUoxRK0dfIyrwH1+6kGEDNuIG7btcKogAI506C0fmK0T+n37Dq1Wew
         /MJqQD2UcI9qOdsiqBSCb+jnTM+7FxnYGjZz4wUh3rrIJxDt9flcDwnVEnSFlxL7x2PN
         xamA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772731646; x=1773336446;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9xcoW1uuOqJuCGhLK0+3X+GsY8ZmUZ0iw8x7VjTHzj4=;
        b=UF8BtzHmAXW8FRKGLMzUAp6K58HlmrUP/FNeD8fj201Igb0LYeog5tBurC6Y7UI6zG
         4Bal1wSv3oJ73Aiyabv2e0QwVcdXUJ8qxeYTPKv9gYXRca0zuLd8voZ/UIQHQ5h5K2GX
         gsGguamWqzaDKjh2yzBgI9NiY3nDAecWCBQjF2ZbJn5PAP2LxgSGin6hZiISaMs/LVcA
         +KSKXNCdJPPcf8N90WUsluspADUcSyNncUPQBkRJlgYHpnJvgawet5EZNaiXQF4GEHN4
         LJFZSDn9eR6N6spEleeHEQJdOqusaQPhZD91/wYQKcgtdWqhsx+i0gX1iVjKcPLc14+o
         Uf5g==
X-Forwarded-Encrypted: i=1; AJvYcCUT+q77r3BeuUAoVJzCyTiaQvVYOouZW1rOroFR9TTsfmxStOA1FDBruKapApMLZJ7+YQc0eZnFOAct7aI0DeLa@lists.infradead.org
X-Gm-Message-State: AOJu0YzVH53sdb54waGcgWV9h95n542okAObjwKaZlU5Few7j0ntX1s0
	jJioIQBUJ8tuki1eZarGRd5w2wE4t85CQbKOXCVLK6xcvfpYBs2yBtoO/NTimQ2dosGCak3H9VW
	3WtEwjzIMQSVVlOoJTX/ReysxfqmR4RAKh95VurYJ
X-Gm-Gg: ATEYQzwDehbpmMo32LeLWEhP5SyPBggmWT/AVu1XxrRLI5+Nc6R2wFAu/GnrjToz8Wi
	yWd4lTjlbr7kLUYZfrQwe2lHv3c1F7oW/MyJEns0rTZ8InwvflhTnlc0mtbvZlNXRQdH/88VDk1
	0175H/qT5iN/Fpt1YI8xL++NtBlBqrpVzHxEmY7+DYtSweXMdmhSfn9he7st+6ppgcuhoEjl3Kb
	qx323oPNpXD2hOtWJSon6k8QTY8E3SAzcQZQZ5oGmCuhOFxkSrzk3HAZrqZrrEG9xPilrwrp1eM
	gxAtRVT3
X-Received: by 2002:a2e:9797:0:b0:387:5ea:e298 with SMTP id
 38308e7fff4ca-38a35158513mr8005261fa.8.1772731645158; Thu, 05 Mar 2026
 09:27:25 -0800 (PST)
MIME-Version: 1.0
References: <20260220004223.4168331-1-dmatlack@google.com> <20260220004223.4168331-5-dmatlack@google.com>
 <aam7JsCyQ5Oacvl5@google.com>
In-Reply-To: <aam7JsCyQ5Oacvl5@google.com>
From: David Matlack <dmatlack@google.com>
Date: Thu, 5 Mar 2026 09:26:57 -0800
X-Gm-Features: AaiRm51o6Q3ZTz6ECMDT5TdlqFdcggDf0j5vT0TJnm45bgTm8VbA0ynEnVZFATE
Message-ID: <CALzav=fV4NX=pxKfX7hH+tO3FBNcSF1KstXsKqprpCj64Ndx2Q@mail.gmail.com>
Subject: Re: [PATCH v2 04/10] KVM: selftests: Use u64 instead of uint64_t
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Ackerley Tng <ackerleytng@google.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Andrew Jones <ajones@ventanamicro.com>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atish.patra@linux.dev>, Bibo Mao <maobibo@loongson.cn>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Colin Ian King <colin.i.king@gmail.com>, David Hildenbrand <david@kernel.org>, Fuad Tabba <tabba@google.com>, 
	Huacai Chen <chenhuacai@kernel.org>, James Houghton <jthoughton@google.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Joey Gouly <joey.gouly@arm.com>, kvmarm@lists.linux.dev, 
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Lisa Wang <wyihan@google.com>, loongarch@lists.linux.dev, 
	Marc Zyngier <maz@kernel.org>, Maxim Levitsky <mlevitsk@redhat.com>, Nutty Liu <nutty.liu@hotmail.com>, 
	Oliver Upton <oupton@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, 
	"Pratik R. Sampat" <prsampat@amd.com>, Rahul Kumar <rk0006818@gmail.com>, Shuah Khan <shuah@kernel.org>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Wu Fei <wu.fei9@sanechips.com.cn>, Yosry Ahmed <yosry.ahmed@linux.dev>, 
	Zenghui Yu <yuzenghui@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_092727_995231_8BCCEF59 
X-CRM114-Status: UNSURE (   8.83  )
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

On Thu, Mar 5, 2026 at 9:19=E2=80=AFAM Sean Christopherson <seanjc@google.c=
om> wrote:
>
> On Fri, Feb 20, 2026, David Matlack wrote:
> > -static uint64_t pread_uint64(int fd, const char *filename, uint64_t in=
dex)
> > +static u64 pread_uint64(int fd, const char *filename, u64 index)
>
> I think it's also worth converting the function to pread_u64().

Good eye :). Yes agreed.

