Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CA40FF887E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 16:17:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fqvRechJO7wAMrY3N92JJRHYmvgDCMeHhLdJTb1GR0c=; b=GBsHX3rLqkzHL9MOMr5302VAGZ
	2Mn1ByKt91LJK4wTTBSi5s+IT5e2bCLMDyPTn2owmbVCgCooFuFwXFboA+NuTsxcetXKaZnpf1aP9
	Lgi/EwtHTk1LtFOVpz5/neeiD09JLSVqK5ImJH3G1YY68wBtsDIM8tXF0fq3B2r9WZ5lUTmNfOJMc
	IeHnCAS9zPmJAhPKLmiqIb0z5P9BkSeEh7D3auKHfgvffPLghwX7ABTTe9S32uTEdLmqEHVsbB3lb
	z12+ban3fjTDv+v+Eu3o6ZrMoTNp0KMVM6dw6EbcI4bcdQ14cEc/f55fI5RePBAX96KwpupA/cb9I
	KMIQfi7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI7bL-00000003uBk-1wlI;
	Wed, 29 Apr 2026 16:17:27 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI7bI-00000003uAZ-3nuN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Apr 2026 16:17:26 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2b243198058so105455ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Apr 2026 09:17:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777479443; cv=none;
        d=google.com; s=arc-20240605;
        b=S9hkLKg+S8yqskH6sSSVSPyLW/9Y8iaLskRKqh/SefgSa6whjlxKvEVROQPaleqA/w
         wYgabKBj6E2mMetD7p8CijLpg4KqtpW8AEX6BX9u//mgxwG3MeHz3fOzuPcwtW9IJ+Qz
         HczY/3QedYZMWIF5R3SNrwTaq4YIzbqa3qav1hf0JBFls6od2Kad7CJi3c/HStttlwak
         /Umv87amYVO0KJThFwbpd9H1woHvxXnLkPJHg6uDzSj0TIZ4S0zrZpQZdA48lfxMQkja
         TTtDcWL+gpsidTKgogDU9GHmbFUd0NzvN84dMneYYA0B6ftaxFwJjIqS7mA4c6hDfOzl
         nzPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fqvRechJO7wAMrY3N92JJRHYmvgDCMeHhLdJTb1GR0c=;
        fh=Z3QnCrPnauyoeppeCl0/yGKbWhtp2yoWvD4+LqlE3l0=;
        b=bZ62HsqBj4Om9e3LO5Ky8t+jTh6M0csSwaYv9O4E5BiYEmtcm3NzN9nm23fDToCnip
         kmevtw+zKcq0pyImL2d1yGoglC02DCD9x9rkQMQynvIC+TyIAjtk4rFhMyvHLpR4Z4UM
         jsZ+b4Tacnc1pJDqOC9Obqs1mFQXW4EQ4D8mq21V1SpH864hJy/fAJrgIi359WOLJMQv
         XR/MNm3eMdCPXccPludH07fzQuxknqSrSB07ozY1h/FNuhcMaB1EEpQwKocSwykH6y7U
         qgBuhDh3K9siTIjv6MfAXoR2h9Uc/KXYVgPc2RxC1oOdqyK1Hc8wmwj9rXSQJgFDbcmJ
         ZB2Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777479443; x=1778084243; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fqvRechJO7wAMrY3N92JJRHYmvgDCMeHhLdJTb1GR0c=;
        b=SOSrDa1+PYMGwG+YjDzTz9NKTSsnRLD83+OIEGTRyd+fGyV3ie82iQWrR1AP0V62kf
         5YV8EqO7gLbvKWc7k94rKmz5gTAGI+kNBKmIsSTQgjkVHuimRPDYdgvTxlq70A7EeMCs
         WGIaKMEbeAAF4ZcG5Q4GbHEQLvX0FCVNB0PeKtf8qBtKsijc2i5Uell+wTaEaBNiyE2a
         KE2KI/ybs+ePCIAF24B+7i8puPK2Z009SRlS1WMUC1mucSsmT7Y/jhOGMhgp+5Cau4+k
         00Bwa8pnRzi5Ez7CxGYUk27r08YJJCF5Vq8nXW4uIwGIxiW3uPOxFcMjEd+C+I4rEyYD
         KxPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777479443; x=1778084243;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fqvRechJO7wAMrY3N92JJRHYmvgDCMeHhLdJTb1GR0c=;
        b=qjYBkp2mdOzqirqvDCRW1p/J6NCZWNWwR9oXBmFhxhczBnJh7W9Bf2REzihc5tYKsE
         AbQpJJBYqqmKEEViJ+MzrB6PFSIG/yysy+y1YXlivbKEYmg3WY1muTimJ0PeeO6ej7JU
         vWF7MA4UDYCLbX8e2ynyfZo98p6i8/ouQXVosLfXHF3NnDrjTHRtVE1dqwtGhB0iuorc
         dZRsI4cqToUy7i6sLYfSQ2pfxyuajHFhq6EZhQQeGug19QlqGfSnHGHKnzEXiuWqVtat
         OzUehwPTjdGAJKkk3WQCHiskUXK3JJsL1ejxI0zQbv3aLvPf8w7dxhipDfQAgI/vqisF
         EtBg==
X-Forwarded-Encrypted: i=1; AFNElJ/NLbE83Ct38L6gTo4aprTooPYA7qW1bPWxnJUsZZ7D+HRY/KUcahgMknDagDSy5wHkt8o9YzobRBqHoLj9/8qG@lists.infradead.org
X-Gm-Message-State: AOJu0YxB+PIH8HMB5W+mjI/NkFLuAfOHHUiJ7YiU2kTkEX0bIvqlJK1M
	+zQt4cUlQbzq31c49UYM/1+DEbe5qg7GVOjPocKbYaFRjbNWqwbSXzhMV7X7WOuGw2HgcvPIvsu
	JvuuT3P0CU/U/ck/6PA90CFHyD918wT6swknlaWU6
X-Gm-Gg: AeBDievaahy3nkAIrmtop3ACM8Q+r1hMCrcKyZxYpM+PYMiVGNH1B+kxGjKOhbsKlx6
	huDKgCVTF5Aj2XWclxsdh4eMFxfaar5Droi/deV8lZMJX5ZdX8Ytp9uKWkVpGy31smQ5LlBgg94
	cSTvphJ2ibyUbl/0mPifoSbRm04TN2/mKc59w6HsrpSmkhA5hcaEOiddFihtX5rQGsmCLm5u6za
	AwvgtPhPd7ACs0Y7DzsIGSAFUPjzL05IrdatyClsev5Of0adlUPSwcyLzw5CHZPaWwvLGyZRn1j
	tePgZccz2mTcOHsk0U9fdU9LrqUpk4xppLyvqF3f66RHFvwKvaR2p/vn2BomioDMStRciQ==
X-Received: by 2002:a17:902:f805:b0:2a7:6c4e:5914 with SMTP id
 d9443c01a7336-2b987cec51emr3278725ad.6.1777479442468; Wed, 29 Apr 2026
 09:17:22 -0700 (PDT)
MIME-Version: 1.0
References: <20260425224951.174663-1-irogers@google.com> <20260428071903.1886173-1-irogers@google.com>
 <20260428071903.1886173-10-irogers@google.com> <afGyYi01XSNIS-A2@z2>
In-Reply-To: <afGyYi01XSNIS-A2@z2>
From: Ian Rogers <irogers@google.com>
Date: Wed, 29 Apr 2026 09:17:11 -0700
X-Gm-Features: AVHnY4IXBUWE5UukN8KzmjnfIpnAFj-ObYvMRfPl-5kwE68RdMoDEeELQc51_O4
Message-ID: <CAP-5=fWBccMoChGX62hVoCbHZSaFJhcPOBYvutbha9RybkNZGQ@mail.gmail.com>
Subject: Re: [PATCH v8 09/58] perf evlist: Add reference count
To: Namhyung Kim <namhyung@kernel.org>
Cc: acme@kernel.org, adrian.hunter@intel.com, alice.mei.rogers@gmail.com, 
	dapeng1.mi@linux.intel.com, james.clark@linaro.org, leo.yan@linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, mingo@redhat.com, peterz@infradead.org, 
	tmricht@linux.ibm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_091724_993948_429BA8FC 
X-CRM114-Status: GOOD (  30.79  )
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

On Wed, Apr 29, 2026 at 12:25=E2=80=AFAM Namhyung Kim <namhyung@kernel.org>=
 wrote:
>
> On Tue, Apr 28, 2026 at 12:18:14AM -0700, Ian Rogers wrote:
> > This a no-op for most of the perf tool. The reference count is set to
> > 1 at allocation, the put will see the 1, decrement it and perform the
> > delete. The purpose for adding the reference count is for the python
> > code. Prior to this change the python code would clone evlists, but
> > this has issues if events are opened, etc. This change adds a
> > reference count for the evlists and a later change will add it to
> > evsels. The combination is needed for the python code to operate
> > correctly (not hit asserts in the evsel clone), but the changes are
> > broken apart for the sake of smaller patches.
>
> Can we keep the existing evlist__delete() code?  IIUC most parts of the
> code don't need to worry about python.  Then do we really need to
> convert them all?  Maybe we can convert only the relevant codes.

Are you thinking of evlist__delete being something like:
```
void evlist__delete(struct evlist *evlist)
{
   assert(refcount_read(evlist__refcnt(evlist)) =3D=3D 1);
   evlist__put(evlist);
}
```
This would allow the existing delete cases to remain and minimize
churn, but it creates an opportunity for a runtime assertion failure.
I'm not sure what the codebase gains long-term from this as having
both `put` and `delete` feels like an unnecessary choice for the user.

> Also I think it's better to split evlist__put() conversion and python
> code changes.

So the existing Python code embeds an evlist inside a Python object. I
don't see a way to add the reference count and keep the embedding
without inventing a 3rd way of handling Python evlists, which would be
as complex as just using the reference counts. We could remove the
embedded evlist and use evlist__new/delete, but the code wouldn't be
functional.

Thanks,
Ian

> Thanks,
> Namhyung
>
> >
> > Assisted-by: Gemini:gemini-3.1-pro-preview
> > Signed-off-by: Ian Rogers <irogers@google.com>
> > ---
> > v2: Added evlist__put to pyrf_evlist__init in case init is called more
> >     than once.
> >
> >     I double-checked trace__replay() and confirmed that trace->evlist
> >     is not assigned to session->evlist in that function.
> >     trace__replay creates a new session and uses its own evlist for
> >     processing file events, leaving trace->evlist pointing to the
> >     empty list created at startup. Therefore, the
> >     evlist__put(trace->evlist) call in trace__exit() is safe and
> >     correct to avoid leaking that empty list.
> >
> > v7:
> > - Added pyrf_evlist__new to zero-initialize pevlist->evlist to fix
> >   crash on re-initialization.

