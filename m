Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CC17EC1449
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Mar 2026 13:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2ib0jE0UROuqHeVvr4xE90sAVXgstdGcpgb+zpFuvYw=; b=FzNCcf1TWPW5BUfmQUSnwURAN1
	oJfiBqXRWSitrkp7wA1xd65ijViRk5fdfN+8q7ud3cCmhPB5QaH0xA936om33BV+qcoHooEOVRWnl
	SEU/AMZh79x46BUCFI6HDaFPVIspMx5LaL/lgC4Ww+k2kloVkR1og4rEujiRPdSINofO+KhgaUwbb
	IbftVxqyfa7itImf/7Od6QVLrGyzl73RgP9pRHbqHuecQNuo5FNf1csrZmozT92inSMeivn5CB3Q7
	qeuh7ln7OfHIn5KMllF5m75xlipZ9AvlvnwaRqpWLwgPdFIbJav5dPBWGZhbo87CgtwC6vx246sKn
	eCO+Ri4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxQ1c-0000000FFti-46qR;
	Tue, 03 Mar 2026 13:43:01 +0000
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxQ1a-0000000FFsb-28zw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Mar 2026 13:42:59 +0000
Received: by mail-qt1-x82f.google.com with SMTP id d75a77b69052e-5069df1dea8so48610901cf.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Mar 2026 05:42:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772545377; cv=none;
        d=google.com; s=arc-20240605;
        b=PW0jbpskxcpyNA7XqQ2zuknNphlp4mrM0ojZjVv/kz6fR5edgin4qxU8qJJqSju96I
         TvEXCjg6EO+jMtKhgAmtNV+PdmOOO6G/VVXwlIHhPg5Qo7feY8MQX1aE5x4qHHSYkFMc
         4BdixgCOuIEFlW1aufXextJCoI8y4clOZmTMyWORXQLIKUMwbDPfdmlky6dh2YJ+MnSq
         B1J5OEPDLJ6dxdx7Hz0b+UB5A45LJf0vCYbzy8RoVMemnx96HD89fhOYhWX31mITDkOE
         8o1ioNZRCLVs/BRY96NQeYGzH35Pw8dNeEYKemSLWNq+hrKy3PIe9BKfX3Iy08vxUAF+
         d8hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2ib0jE0UROuqHeVvr4xE90sAVXgstdGcpgb+zpFuvYw=;
        fh=wN0Wwj7xfjWDEgaupguRrkhvPLFEcmQSPNjTR5An5/Q=;
        b=Dza5xIHpYbD0JcJpsnDKvgTLEPFYVob+y1P3xfI3dPfbJJ4VGu48rsARCQl6DI8qFn
         Gw1z5EUehz6B9+EnAer5g6vhuViLjQ4pVOoK2+rtZjGAnV4NLnnRnNKE8XCzhOdR1qJC
         nQPgRfc5VzvZUZoqx+TuKZXSLo2H4FFPpN7LOMP70Tq9n4IDblDnZdcIrDciJk46RREn
         JPNRNLRX/Msw+w6tGGP7s6o7Qd+7zmveIFZnS6h8IZ4j3s9x/dxM+8vMopeZ7+vW5Dci
         S7qCNJsMWO5T/XmPdAMoUrkxbQJ3sQEiMAZh7vBO2hi3MhJ+XR6O0IeRu9YettnX1WLT
         YrhQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772545377; x=1773150177; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2ib0jE0UROuqHeVvr4xE90sAVXgstdGcpgb+zpFuvYw=;
        b=gbWJdim1iItB+IVC2RoGy2qst0hcNLDf4cDZNv06WHLmeC3c9/LdU0VuLg1gJ849OY
         NVwMEs9ARbJ0qM2bOLav+AftSRXylYNk2XCgiA48Zic+poJynR48cRSi0h2GajISrCX0
         QDYM+qYCHLa7wQsvdzD2ghNv86rViCE+GiTNk0QdcpJJa1936gdAxrXTIld10Pf1psf6
         x9SRvVtGXHx7ZpwL4R2aAofpNNvyXJwq9t+n/YZIkaUjcNrv94wbm2d0WdE7X9XqkD+3
         AAJTLvWt2PS/6bMgsG9cuONwbgz8iPE0t1/M6PR5hH0rrJf/FVK/KEs143/sAi8jJckX
         QBOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772545377; x=1773150177;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2ib0jE0UROuqHeVvr4xE90sAVXgstdGcpgb+zpFuvYw=;
        b=te0M1XjSFwc1+kXqc3swQU7+T0oeqnEBgjJrJB5jxIcaqZZaY0ZuRKj5tJc0XO6plf
         kPWmck/B9I52bTivjd+9FCePYYzb6LJpWcVD/NMvbs9dQsWjUPTzFZ3/N4qVAl/fg+Dn
         y0bxBvd/9p7yds+VD4A8lmPfkplMs9+1pe9Yz7Ke6hNigkgnPb7YH6gJKgbKmv/vNi13
         X87q6rtqx2xNZcMdibVqcQvmhqO6aU76DnHi56Q/QTs5AALIN9wcbDhGXPOXtS9jqbxO
         kL4RpVBf0HOSuwWlefSMnJNQnPB5etRun9wyHrQQ4I0vzrac1tAr7Bni2t6XBaCwgtfQ
         ueVw==
X-Forwarded-Encrypted: i=1; AJvYcCXO43yrzlYHAuoMtvzxXjO2Sxx7wIChPhPerV3OY3qe0dsG/0+usJpwXgUsGpBlAlBhZizk2ZuvVcec8t3FsqQ+@lists.infradead.org
X-Gm-Message-State: AOJu0YymrvK2aHmjzW6XFq/oPblO7YuIXv4zU2pEiwj5WNzZiHP3P2eu
	BWp+dSJNiiBXFMsenuQoIQG2YxMd/+U+6QcdfKhgzpWleYtPwRh+18gk2Q8nIYrpjGZJwM+6fpH
	NuX9LolNVP87GrPt8NBb9r0qIA8RAxZcRf/Y++pSX
X-Gm-Gg: ATEYQzzda4yJgFLoMMm403O1GFDZHazgZO3ACqz4D825mG24cjo+ICdifsL2n0mAO/M
	qpP7DEsqlj3Xj+ebgF1lUFIWh2yH/idEKXtcxlwPs8InANZa4bMYW/IBn4tnZeVrWlUOUF04MyS
	x/bt6+NR3InT23LyCwG1wz1I72fS+kzZ2B3jrXgcpGIrXFpHexo8q/49vIdHEmos23X/9yJLigT
	ceVNywNl8qakbSIj/TOM/BIR5Z9wala6MUtH/yjaGh5fsAm6g/tqD93HtUOvaauieBqqrr67Rtl
	amn4V9xqeqA++Z7gzUzhhPMpnrxXOfVuI5l3MA==
X-Received: by 2002:a05:622a:4d:b0:501:40af:96bf with SMTP id
 d75a77b69052e-50752989987mr225891971cf.68.1772545376634; Tue, 03 Mar 2026
 05:42:56 -0800 (PST)
MIME-Version: 1.0
References: <20260226020748.1282208-1-imran.f.khan@oracle.com>
In-Reply-To: <20260226020748.1282208-1-imran.f.khan@oracle.com>
From: Alexander Potapenko <glider@google.com>
Date: Tue, 3 Mar 2026 14:42:20 +0100
X-Gm-Features: AaiRm520pyinVR1ZOFHH1Ic9lRccb4y7w9GFdFD-xIdy5G305nnhw5SJbP9BMW0
Message-ID: <CAG_fn=XrQeLLFWuJx7XCaOKWJu+z3c_7S1mAu3HtP_dmd4xnMA@mail.gmail.com>
Subject: Re: [PATCH] arm64: move early allocation of kfence pool after acpi
 table initialization.
To: Imran Khan <imran.f.khan@oracle.com>
Cc: elver@google.com, dvyukov@google.com, catalin.marinas@arm.com, 
	will@kernel.org, kasan-dev@googlegroups.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Mark Rutland <mark.rutland@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_054258_589602_48E45ED8 
X-CRM114-Status: UNSURE (   9.08  )
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

On Thu, Feb 26, 2026 at 3:08=E2=80=AFAM Imran Khan <imran.f.khan@oracle.com=
> wrote:
>
> Currently early allocation of kfence pool (arm64_kfence_alloc_pool) happe=
ns
> before ACPI table parsing (acpi_boot_table_init) and hence the kfence poo=
l
> can overlap with area containing ACPI data.

What happens if another allocation occurs before ACPI table parsing?
Can we enforce that this is impossible?
Shouldn't the firmware somehow tell the kernel that the future BGRT
table should not be used?

