Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D8E8CD98F8
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 20 Jun 2026 02:31:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:Cc:
	To:From:Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=sXImjckqEB8D0g/Or96GavQyrNf4YhZov4lo7C+jfuA=; b=scSFUEotPDoIZj/oveAJ6rMh+o
	S6bV0YDrWjRzvX17DCOQLUxsemar1OKYoOtG5CqVrA5cCTFRCp8u0YF1ZbYAiRVrMOGBqGaFZfxT3
	GVA9ivO5voErRtApt70XxkYwg6cysYDDdlCnzxfqyt2w43eX0fV3hkT1Pa3cNGtNLi1Nj5C9PjobV
	KGRPWb8npw8BN8R8xa2JWzYZpRCE+LMrvN81cutwtxR1gvrH5B1PC3qPF9pNQQvXqF2g3AHVmQ+8T
	Ji4+JhoUWi4q/atn4nzQ5V7z/IAbH0TPru0Vmp8hz18vgPC/mtZAyxslQ+yhatiIMCwaaQKGOrEkU
	KqMBsb8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1walTr-0000000381a-1nwv;
	Sat, 20 Jun 2026 02:30:47 +0000
Received: from mail-dl1-x122b.google.com ([2607:f8b0:4864:20::122b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1walTn-0000000381H-2KgP
	for linux-arm-kernel@lists.infradead.org;
	Sat, 20 Jun 2026 02:30:45 +0000
Received: by mail-dl1-x122b.google.com with SMTP id a92af1059eb24-1397e093f90so6721059c88.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Jun 2026 19:30:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1781922641; x=1782527441; darn=lists.infradead.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sXImjckqEB8D0g/Or96GavQyrNf4YhZov4lo7C+jfuA=;
        b=Sk4Thg6HnJmibGlnV7xGLLsIHIqYXyt949Hvn1xoMhOBgJbYwzx0+KlpUqvJhJalxu
         oR6fKlDdX/gESB0Chm5rHfNajv3pLojradiBBgI1q/S5KXnho8ge3O5t52KBxmQCkj5m
         jYwwXZ8UgB/jzMihvq8+cnv2GUSx8n5XVR08z+0mUL9VIC1ID14PJa6qZy+OXt44ye/S
         +rZvI6I73gbkuj/5duTPu1VUJipWZS5vcx7BxahmvFRapt3Bj0D0jdfp6mU7VZPxc76q
         cEBy2GJjT9LNnK5zls/aQ9StNmnIgzqmgY1dXZZLnG3oWIr70n9/IZzPcQ+AwKES1JwU
         INWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781922641; x=1782527441;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sXImjckqEB8D0g/Or96GavQyrNf4YhZov4lo7C+jfuA=;
        b=i0AwCK92H1yOt4BGPNA61iX5IF1EOdk77nIV8Mpkds4LqKHWPzXAJnV575CGKnqyfm
         eeR24oHarGxHKJeUYfait0ffS+ZQUuS1t1PYf0zwM0UzfKgnhYzRiVNgyR9vGqzYegmq
         RK88feXHs+iFY5kgr4wJhrFdEU/TEc1BprgMkHao7nqUtF+orb1Fd2Pfi3dnumr36wLJ
         E6JxoeXUJm83DUzqRqSyl7wl1njiyN9Wu8GEhy+PsltOb4lz3PaDsqtuDnd52Fl+YS7R
         v0fAmM9S/whA1vNO9LJNGWoXTRua1iDQ61kJmIATeKWSOEuqEA87z03dmp8rrpeNlJ8t
         2uOw==
X-Forwarded-Encrypted: i=1; AFNElJ+d8wxJQJrK2qXTZ8DgRgMPPggxCQOplT4RVZcUN3lv/7q1LQ8WJFp4QTZl9TJkB+HgM/SH60iucyRnJLpCd9Qh@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8lgNy7186MmVrSRfz2aEPn9PYnw4cRlBvPuQXSxTso/pYNegl
	bSkEiZdhUtxAr1aVFnFmn7UfK/ywSP7IgqNIqoElyJBeuK1yheNkNGSpqLWU6uL0d6UNz94/Wq1
	t1C3M
X-Gm-Gg: AfdE7cndXLBFeshZOWcNe/SwmV65xqDb/1HXpXUQlxVcakT1vchNvbcuBa2ctHy5Ze3
	iQiME/NORbsn9GhyGZXMbqKCvmhwU4pQQm8ztinUPUY9Yb0GCki2pjws+kymfT6gVgof2zTHWTB
	9EicbPkTgEdHkITpqNvHhtgimnOBXDgOPj5V6yD6gLDrKzbR8GaUeqpy++6DrssteC8fZ1zNOW+
	B9piPm5LWJZ9nytrmaP7d5BLbBVZKqCyl4ozZeYXNCJr6HwhMabe2qz46eS6H8DbpL/EpkQ9+Bh
	Rm4JXluScgcpipvjz45cmvHtZgNf8xc4iRQv+DxVXoFX1Dl/UOqxcwIErsZxy4NLC+pX8R7vc4q
	nCoWjDdcG93HsjvnrvTGcXjdAleu6MaB23XofYMnNi6tYP+377tpJKi6+C5QLeoqSfPc7w9pDl3
	31mPh8Aw==
X-Received: by 2002:a05:7300:8c95:b0:2ea:5057:a304 with SMTP id 5a478bee46e88-30c06e03f03mr3890958eec.2.1781922641039;
        Fri, 19 Jun 2026 19:30:41 -0700 (PDT)
Received: from 330cfa3079ca ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c1be5c5desm1988067eec.28.2026.06.19.19.30.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2026 19:30:40 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] arm64/for-kernelci -
 92e3f6ef4ffb1f65e7774f4611c27fb764b3bc14
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: will@kernel.org, linux-arm-kernel@lists.infradead.org
Date: Sat, 20 Jun 2026 02:30:40 -0000
Message-ID: <178192264021.17323.9854948270991678156@330cfa3079ca>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260619_193043_601900_D9C768E3 
X-CRM114-Status: UNSURE (   5.67  )
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
Reply-To: kernelci@lists.linux.dev
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org





Hello,

Status summary for arm64/for-kernelci

Dashboard:
https://d.kernelci.org/c/arm64/for-kernelci/92e3f6ef4ffb1f65e7774f4611c27fb764b3bc14/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git
branch: for-kernelci
commit hash: 92e3f6ef4ffb1f65e7774f4611c27fb764b3bc14
origin: maestro
test start time: 2026-06-19 17:25:47.988000+00:00

Builds:	    8 ✅    0 ❌    0 ⚠️
Boots: 	   24 ✅    0 ❌    1 ⚠️
Tests: 	10579 ✅   84 ❌   93 ⚠️

### POSSIBLE REGRESSIONS

  No possible regressions observed.


### FIXED REGRESSIONS

  No fixed regressions observed.


### UNSTABLE TESTS
    
Hardware: bcm2711-rpi-4-b
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - boot
      last run: https://d.kernelci.org/test/maestro:6a3587e0ec8c023893a36461
      history:  > ✅  > ✅  > ⚠️  > ✅  > ✅  
            


Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org

