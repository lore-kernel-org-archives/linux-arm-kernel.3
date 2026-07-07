Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D22A9C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 19:26:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1u0DNx/dvFBXj7ONBaHCpq/y26kmxzUXBBihnDFYivE=; b=mOCcTiefxcBbmeVBJRfvxXW7TS
	IGwTNEYD1mMKGPY3LxegsRmKnuoze/UOsd0O+V1/UVUB7yGkIbA8b2Brd0TzMs7Txao3XjwOCYmiu
	NDFLhTAQg7YBL1Mf+4BYzUMJ2HexkUxH07X++UNzE47AESK+dT58SaECFrEHpqAmrvyjtAeTCum5a
	3MH7udWY9DjMccUfdDYOqinhu9/mYEdMwGakU+Hq2ULE3rg+MhXIDA0xu3WtJk5pwiB99Fx20hCjB
	noT8SNPhEMNSRWCOO1V0f6Qvxx1I8jiogMQ5zF95xTy5QJtD//oYyMpA1WA6GicOmPZbZIVdGqKYM
	mJB4YYzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whBRH-0000000Fkws-3KFL;
	Tue, 07 Jul 2026 19:26:41 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whBRF-0000000Fkvl-1GHE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 19:26:38 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2ca70925c25so58782825ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jul 2026 12:26:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783452396; cv=none;
        d=google.com; s=arc-20260327;
        b=A4gCkIPGRy1acbSJ3IPh7XKMhvzPfI99itXzOSb/dNTBxM2OmVNnEYAhTPX+dGDtSQ
         nPtsQOEacSBF+XU0HR+ePWe2XGuQps5vQDjjoWHUqy/t046OnyOpnscbSuY0Xo9e+4Qj
         6YRB3mLxrypdiwLx0l3p7m5OPsA+2X6LqTBrIYVy4SRMMC7+MxRlSKDN1mh5Pf4vA/su
         G2dLHhRyrYPNaDzG+cyqAjK26kO4P3AXCu7/nKdvZ2AOG2KUr+Q1tu+9xHYNbDAKDf3l
         ec/ocup3X6QB0tf0oVQ/FjBWbHht5lZ5CaXOhOHVBadVjNeAjS2VDaYIM4ItczZHNiQO
         ZQsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1u0DNx/dvFBXj7ONBaHCpq/y26kmxzUXBBihnDFYivE=;
        fh=3GsGadLCroPc7s1xKQ6iMBF1+AnwV1DobPET0hOHKvs=;
        b=SnLzKZKyWXe7rKsaMfYzwEJu4afWy8FpmbvEp9wi9UGNiwARJV8VsQ4EjUpl/Q/45s
         3od2q+31o0Pdh24Qrf2GAeQe1sKg/7Flai4bpXY6zkNC9Ila88Yz88oveCMyW0d2Olfk
         OL+rooVkOAEGmytZEwakTD95Cv+UCsIdFUE1Vh6ZOneYuZrTuAmqaEyt5eEI6jjb56Wj
         b+yA6S3WU2Gd7JQUqtWXsrL6aoeVfInt67NIBhlL1TmoxIJYLoITPrHHmNe5yEX3aStw
         oTuP6JD5JfQb0OTFLje+Xix97DYoiEtL3Pb7q4e7iQHe+axoERPq2S+eAm1X+q1i6pEd
         X5IQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1783452396; x=1784057196; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1u0DNx/dvFBXj7ONBaHCpq/y26kmxzUXBBihnDFYivE=;
        b=Lrc/LSGFsWiVAiKMZiCEpcw7xQh58ZcBeKXZbbOa3kll0fUfSFmJBe+ZgX4XM7jTHX
         fTAt8US6KRh99ukH9dCAFugQS4KrWQAJNPbMJl8d+X0snRIReW6mxFrgQjYTlEpDzztq
         xA9s+B70D28DFa4L7J66H/3irILW3UfiWQeA4/SxMcv3R/Yh0hCaqH1d3UnFhDK2fl59
         TUKnKSgFiuGIOvGu31+bVnoklCy+f7N1fllXyCBxECbjg7UZB8dHOPXCxYrUmQzf1HRP
         zw69RC7JhSzoXYEBzlzAWlKHBpDAiHP/lB2kn5orfJu9JjLtc+P/qQnYjPNK8w6855+C
         47lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783452396; x=1784057196;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1u0DNx/dvFBXj7ONBaHCpq/y26kmxzUXBBihnDFYivE=;
        b=GgJhP5B6eTVsZbyQUMnl+KU7fSX8s8qsQluvW3hthFjfDNeas6pELc5dqON0Yw3byq
         TzMrkaSNKLawgU+eFoOgRrzZhEI8WdVgUVKbz2/1FacLCP2O4+ErUBKWeWzBqIFdIk8y
         fsoIeMf16nS80iHXmNX9bOtLVU+4tYXA8fYkouzCenO4hcyDW9jd2reRIE4+de58BA3v
         lhtCgD2GAYOTTX8/hzQeLXTkOufSiB+yMlUQ792Fywlg8vf9s9wK6NiIKE9tgcmrCJ6X
         XX+UEFH692Gr+znYmnYlB4ViAA35hNLlI/FtLLSdOBugZ654qpUbePFG4kKF5GagseaR
         2Rbg==
X-Forwarded-Encrypted: i=1; AHgh+Ro4rI2nVwOgi29HmybJ2txwCIfdVUDwm6q2LBliHoHFfoV+5mKb+JZHRaczExcXUXpobPeQ0IKEKARvNSpTd4Yg@lists.infradead.org
X-Gm-Message-State: AOJu0YxENY1P7lMGL666aiIHJgFUYtdLWwyvnAW/v4RLFcSTABI0ycpg
	0cOrL7c4RA0SXZJkWNQRqNQe6/bcDKdQP3US/Dd6cLJ4dluOyMcr75tRuYn5AkOYvplZm+CnEGk
	MDsVXWoYXKuBOcFMZ3suGJSYV4caIDIk=
X-Gm-Gg: AfdE7ckIVYkLnrGYAI0HNkYchZhZj461g8IevZ1ibd7vhmIlqlXb9q3TCnFh/VVqrs5
	Njfomtxx8NBMGNoTSvid1b/VRKoz7hEw3eHjiaVFIiUiRWXvgmMW5dON4XqItgozcc3B4Mopffn
	kofumgJwV6s4KEaTa+PM9JgVtbp5T/iF+M1Q6wA2NsbrfJNBQRbOsyQkOmLy0IoiY2bG7eFbKm7
	lGSHFD705qWzVLgVQU4mrAy0qUGymonxNcUtGesOCNOOby3rKXfakYXRK4aC9UYS8FcV1fJPZmj
	ADIK0wpQzQirmLWQod4Zb5keQQ==
X-Received: by 2002:a17:903:248c:b0:2ca:11af:5ee9 with SMTP id
 d9443c01a7336-2ccbf0515c7mr44657295ad.25.1783452395771; Tue, 07 Jul 2026
 12:26:35 -0700 (PDT)
MIME-Version: 1.0
References: <20260706093508.273968-2-krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260706093508.273968-2-krzysztof.kozlowski@oss.qualcomm.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 7 Jul 2026 21:26:24 +0200
X-Gm-Features: AVVi8Cew5STZTOkHk0OKqMhqBm-tS-RzEUyhCNysxzBbiVbMzJ57Y2V-AnBf18k
Message-ID: <CAFBinCABGgQtsn1MsbQn_wjuCAUTaTaEhbGbwNjKeJRx-NDcZw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: amlogic: Correct indentation and whitespace
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_122637_344689_5380A45D 
X-CRM114-Status: UNSURE (   9.10  )
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

On Mon, Jul 6, 2026 at 11:35=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:
>
> Correct spaces or mix of tabs+spaces into proper tab-indented lines and
> remove other whitespace violations.  No functional impact (same DTB).
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

