Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF7CDC5AC67
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 12:02:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zwphYJ1xrn2R49LbIW+60BAY3dMAjsU1OcBiJKmRCAI=; b=w1XS4ebJZeIGSYkdLT6ckiqYTM
	j1qO5OZaZsBVVM1HgUXjaxtB3boWk9EMGvHwGQD3rjLiSM/m/mzm1Q+QhFRpUEqftEH9yMws/5WW4
	CHmZdXIBJFeHPfNerVyZ+xMc83gt/femxqWOQ0cUZNMLd3sQLky1+vzMKkm4sRMs5V8kt0JZvdNdD
	20qOoJb6PHAZoWb6EUx1Itmis97f6xvVtPLTTydmmuNHV2vbXPWpliCj/hAImakk+vX3QJaR7EFMb
	FllIxpIHyiEsJ2NkC+3Wvv1J+76pqZZFbBmmD2hk4JQrIi8A5jnmRf2C0CgHHpBgE67oP9q/cQ20n
	6tHGrvKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtlBe-0000000DyTO-0L1k;
	Tue, 11 Aug 2026 12:02:30 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtlBc-0000000DyTF-3GSt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 12:02:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 305A84352C
	for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Aug 2026 12:02:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEF961F00A3A;
	Tue, 11 Aug 2026 12:02:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786449748;
	bh=zwphYJ1xrn2R49LbIW+60BAY3dMAjsU1OcBiJKmRCAI=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=UqpxGeW8QFJ21zgq1eXGNj8dqipCjtSFaP61uzVQFCtsN3Rr5660Vjp62xzBBAqll
	 S2Xu9hl2Ba/BjC7L45ZM/XEILqYyN2r1ktVyPKHIjawhK/gcAVf2uyyFXGCdwMyaIx
	 E4ANYwjVPXnZaiSDmYtTDjtP2Cz8lodbNKTLecE/3JWFknc/9mALDUEZgr9qBqjQP8
	 7DhWvef8ebjtDByb8jxL7mkLqN24D30aqyNnzy234vrhoBkIRrwaeTQXdALdjlvDtp
	 DjoCw3GmKUKf8aBm/mtbB4gR2I6RboKARJRyfxz240ZCbqIi5hQZ/ZaHiqrd/2dCkh
	 tvwFKaEcJ4Bew==
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfauth.ams.internal (Postfix) with ESMTP id 38641198003A;
	Tue, 11 Aug 2026 08:02:26 -0400 (EDT)
Received: from ams-imap-11 ([10.64.2.31])
  by ams-compute-02.internal (MEProxy); Tue, 11 Aug 2026 08:02:26 -0400
X-ME-Sender: <xms:Tw97akBcZO3noPhHlKZXJ6TlqWlhZp6jGlTb_fseV8X0h7KBOqZ4mg>
    <xme:Tw97ahWbK6U0VChhjl4YnC1c1jLtL2ntKAjHqjBzsZbHrdk5FW0q7zz1Czrn5io4s
    mltjcZEpo3GXD1J-S_y8HPw3ZJTcygRXEqW-6wtQQGNTKELUEQm-cM>
X-ME-Proxy-Cause: dmFkZTEyB7N7n6QM0Uo3Fugkx0WZwpgnnYkOCEIKtQcEYUqJPHieMBMoFgezVcrXKKV7hd
    xWZH74le51w0J1e43JssBhL/DpFYP6adM69IhvYR6He3VZj2kqrmHmaas0+tKDozPK6r0Q
    Z4zQ6PqZpYektv9tEVBYYTO1DO5IoRAnqKDtBkEE2TKmKtzJjwjBQ/x1lwOgRkKCG93Z2a
    RQCU9ufEeCkraBehAgx2QEAfiF5jfQj3coMyC/kVB0tP2ctqZ+lrm0Rm7YVDlOpyPqNgg4
    c62CUJeGpkoXSGuovSIbHPOUb6hZdcTuvd6NjioJ/SCyrfGXYNkTPag0aPsnQRVWyIMumF
    o/7VIdxIgEe28JBfoGgbeIlvc1u8Rzxl8QRwveHFNuGKZI1pctrvDvqt+pEtWeqeIIPR9y
    p8OwXsjS9jDR6vrcorF1o2jPW+ErPy7PDefp1eluDIjeQ2I5OUCzWH0daOzdI/hMu7RD5d
    ufIoKKjBsm5xaND6Ljn76nI69bi4aF4RkFjq4AZPdZNIa7SmrvojWxUVgW0foRB33KW59J
    uLWPYIs6dbO82vXrsNi3HUu4ICxP4OOjwWolZno1YvdAzyT73UJPGLQisIfzUxpHYyOROz
    G28IMdyhxmYRg/ziti+j/0li/MQLrH7fxGd5Ktr2eL+6137awdMdMECab/og
X-ME-Proxy: <xmx:Ug97asJo80jiwGoVYyVAieysZnqNfTPGXcp_OLDIx0NyF-j-4xG61w>
    <xmx:Ug97asR3VdH-QkDJg0ZLwjqLxERpJL0YLzmBF9rZwWbdzSrJsiGlsA>
    <xmx:Ug97akIr49It671AWn1SuOKwQu83sjXLQYhKjm-s8ONS4sFUaJGpRg>
    <xmx:Ug97av9WNa2NfL4zX_vibxK_D9NO2kYnuAa1XSIwHPurmFwsgdOGJQ>
    <xmx:Ug97arJIWhzNw6dUMlljVxhTOnM6pl_mr4T4qU_igFZwZXvyWNGWhcKf>
Feedback-ID: ice86485a:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 28EA8F8006A; Tue, 11 Aug 2026 08:02:23 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Tue, 11 Aug 2026 14:02:01 +0200
From: "Ard Biesheuvel" <ardb@kernel.org>
To: "Will Deacon" <will@kernel.org>,
 "Nick Desaulniers" <ndesaulniers@google.com>
Cc: "Josh Poimboeuf" <jpoimboe@kernel.org>,
 "Catalin Marinas" <catalin.marinas@arm.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, live-patching@vger.kernel.org,
 "Song Liu" <song@kernel.org>, "Miroslav Benes" <mbenes@suse.cz>,
 "Petr Mladek" <pmladek@suse.com>, "Joe Lawrence" <joe.lawrence@redhat.com>,
 "Mark Rutland" <mark.rutland@arm.com>, "Mark Brown" <broonie@kernel.org>,
 "Kees Cook" <kees@kernel.org>
Message-Id: <4986ac98-d6da-474a-b218-b6468b68cb9f@app.fastmail.com>
In-Reply-To: <anrvDIWMNGIa4WPK@willie-the-truck>
References: <ed4fe1f95071897859ec7fbe9176246cbd4962bf.1786138806.git.jpoimboe@kernel.org>
 <anmobvJXiBQqWn6S@willie-the-truck>
 <e5q2mvqtf6iw4lco55uny5ffhppw6vlflxguhc4gg5nm3zdvmo@zs6rw7iov5qc>
 <08d6c5cd-9924-4359-9181-a03718161528@app.fastmail.com>
 <kp4rvh4vxo65gipgqz4i4dnw2ueylmus4yys6xfrbngp5nefzn@4a4ekjlzqlph>
 <CAKwvOdmSVjY0TmOTc6WMmDHcLbn=tOV3R3zH_TO4zXZiYEsaBw@mail.gmail.com>
 <anrvDIWMNGIa4WPK@willie-the-truck>
Subject: Re: [PATCH] arm64/module: Fix livepatch BTI exceptions with Clang 21+
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
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



On Tue, 11 Aug 2026, at 11:44, Will Deacon wrote:
> On Mon, Aug 10, 2026 at 09:41:35AM -0700, Nick Desaulniers wrote:

>> Sure, but let's replace this with a link to a bug report in llvm's
>> issue tracker?
>
> Yes, please! I can apply the patch once we have the bug number.
>

I can look into that.



