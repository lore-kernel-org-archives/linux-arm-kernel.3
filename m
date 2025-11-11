Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74AE4CCFA18
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Nov 2025 18:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/rF31IYZ/B9gwsOv2PIcyvYPU3h2imvQVFrrK+wh8UQ=; b=Ngr7OMJFB8g7I6S/hPpJMZPLVV
	68TcrhiaYRIiR1KXf6I0OAMTw9NIeZzTxW3vp+HLYyK2DjRODBldiw9iBFAZ7Xqw/Fpe6+UekZJSt
	7gVDaI0XXpAS8PdO2wUU1UZu2CX99qRmsVXwiKSYr9yeX+yCbT1NJ1EqOCriWWlwscIjCZEtwojXD
	fl5MauPo8FCQ5qqmon/tgirZPvxjsJSpF1Wbxw0um3LiRYrtlZc4QopN5nEWj3EujG/H9tVWZEoqG
	5MMLGhzicOxn6Il+AtYfF9GBri9/vLxMh2VYq95p2xdnFqPbkpo6yXSSl59d8jKU2FSxgUtAFbt0o
	6F5T3MHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIsfA-00000007ZVG-1E8H;
	Tue, 11 Nov 2025 18:00:16 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIsf9-00000007ZUu-0KCj;
	Tue, 11 Nov 2025 18:00:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 076F1601FF;
	Tue, 11 Nov 2025 18:00:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C089CC4CEF5;
	Tue, 11 Nov 2025 18:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762884012;
	bh=YbvVeIxBxMZpmXdjYhUx8nwj49MbsEoFDBh2JqYePf0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qfOChaSGhMAFuWs2UzChw+LX7w9ddO0Lu3yodA88bbRsfPPZyivrIHB59q36dSaUY
	 IkZFm9AYnKMAgKui34Is98oeSzGTsaXWWlAp4ixzbQ3Lj9HPqHrijnaeJ8lghQ+kH8
	 Xpu8+ZMcIQHYSlqXF+0ef+2js6EBFfdtbZcHBXnXpfSpjMcKgNH56pX/fGq4tLAz6Y
	 tqQsWQzV/e9sCE7nn8JDr0tapUnCcAyaQTRZTTyl66tKX5xaJDFyL4J0njMQE/6eVz
	 q5GEwq1DSFSMfMwFi0A8w8kJd14LTQE2FYBnLfGCSuJrstkzbNLSGEuTzKO6DCNIuT
	 uzmjpi67z64QQ==
Date: Tue, 11 Nov 2025 10:00:10 -0800
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Tiezhu Yang <yangtiezhu@loongson.cn>, Ard Biesheuvel <ardb@kernel.org>, 
	loongarch@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-efi@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] efistub: Only link libstub to final vmlinux
Message-ID: <32s3lvzfu6jkyho7qenrqbsm5wkgjnzn2imdp6tfwycmyxpzgu@kg5367uxmxii>
References: <jxfb5a2c2qber623l2gwewirwod54bbgfnvt7t7f3jah2ea33g@2uyhy3auzmpx>
 <d9f3352a-1c1f-464a-a8fd-741cd96b5f8e@loongson.cn>
 <CAAhV-H6m5vszCyiF3qi94cpHBPVuqM2xH93D=gfsQqOSYvC-sA@mail.gmail.com>
 <33612d85-e70b-26da-8460-ea6b9064ce08@loongson.cn>
 <CAAhV-H5ZSTFDxvm-W1CrgEoQ5d_jw5yVsfetQ_J_qL5pqLtzgg@mail.gmail.com>
 <CAMj1kXGk0udgM67wrWqahqK8H0uE8emQj51SmJey+7fE-FTjdA@mail.gmail.com>
 <CAAhV-H4c=vdNWO0v_mYL2xZ9FYjDyRDvt6f_kV4d8Bh=CRJniQ@mail.gmail.com>
 <CAMj1kXEaxxcWTTANWeEMNjYDymdL5Fxy2B=XBF4RGtteEkfinw@mail.gmail.com>
 <421c08e1-255b-447b-b5e3-ee6544fbefd2@loongson.cn>
 <CAAhV-H5KsFShDJ_Cxu+1_ces8oojn8+S-7PLmE7aUj8gX5_GEw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAAhV-H5KsFShDJ_Cxu+1_ces8oojn8+S-7PLmE7aUj8gX5_GEw@mail.gmail.com>
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

On Mon, Nov 10, 2025 at 03:00:00PM +0800, Huacai Chen wrote:
> On Mon, Nov 10, 2025 at 9:19 AM Tiezhu Yang <yangtiezhu@loongson.cn> wrote:
> > If I understand correctly, I should modify this patch to remove the
> > changes of arm and riscv for now, do the changes only when there is
> > a real problem or requirement some day, right? If no more comments,
> > I will send v3 later.
>
> Now everyone involved agrees that the efistub code is correct, so the
> proper solution is to fix the compiler.

Hm?  I don't see how it's a compiler bug.  It's really just an objtool
limitation.

> Changing efistub code and changing objtool (ignore __efistub prefix)
> are both workarounds, but I think changing objtool is a little more
> reasonable. Maybe Josh has different ideas?

I thought the conversation had converged on what Tiezhu mentioned above,
which is to skip objtool on libstub for loongarch, but leave the other
arches alone.  That way objtool behavior is consistent between loongarch
and x86, and objtool doesn't need to ignore any prefixes.

So basically, the v2 patch minus the arm64/riscv changes.

-- 
Josh

